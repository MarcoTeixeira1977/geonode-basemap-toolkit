from pywps import Process, LiteralInput, ComplexOutput, Format
import spgeo22

class AtoBRoute(Process):
    def __init__(self):
        inputs = [LiteralInput('x1', 'A point X', data_type='float'),
                LiteralInput('y1', 'A point Y', data_type='float'),
                LiteralInput('x2', 'B point X', data_type='float'),
                LiteralInput('y2', 'B point Y', data_type='float'),]
        outputs = [LiteralOutput('path', 'Route path from A to B', data_type='string')]

        super(AtoBRoute, self).__init__(
            self._handler,
            identifier='atob_route',
            title='Define an ASTAR optimized path from A to B',
            version='0.0.1',
            inputs=inputs,
            outputs=outputs,
            store_supported=True,
            status_supported=True
        )
    
    def _handler(self, request, response):
        route = spgeo22.proc_AtoB_Route.atob_route(\
            request.inputs['x1'][0].data, \
            request.inputs['y1'][0].data, \
            request.inputs['x2'][0].data, \
            request.inputs['y2'][0].data\
                )
        response.outputs['response'].data = route
        return response