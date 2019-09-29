<sld:StyledLayerDescriptor xmlns:sld="http://www.opengis.net/sld" xmlns="http://www.opengis.net/sld" xmlns:gml="http://www.opengis.net/gml" xmlns:ogc="http://www.opengis.net/ogc" version="1.0.0">
<sld:NamedLayer>
    <sld:Name>rb:rp_struct_pop_geom</sld:Name>
<sld:UserStyle>
<sld:Name>Communes</sld:Name>
    <sld:FeatureTypeStyle>
        <sld:Name>Communes</sld:Name>
        <sld:Title>Communes</sld:Title>
        <sld:Rule>
            <sld:Name>1</sld:Name>
            <sld:Title>0% - 10%</sld:Title>
            <sld:Description>
                <sld:Title>0% - 10%</sld:Title>
            </sld:Description>
            <ogc:Filter>
                <ogc:And>
                <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>level</ogc:PropertyName>
                    <ogc:Literal>Commune</ogc:Literal>
                </ogc:PropertyIsEqualTo>
                <ogc:PropertyIsGreaterThan>
                    <ogc:PropertyName>tx_pop3044</ogc:PropertyName>
                    <ogc:Literal>0</ogc:Literal>
                </ogc:PropertyIsGreaterThan>
                <ogc:PropertyIsLessThanOrEqualTo>
                    <ogc:PropertyName>tx_pop3044</ogc:PropertyName>
                    <ogc:Literal>10</ogc:Literal>
                </ogc:PropertyIsLessThanOrEqualTo>
                </ogc:And>
            </ogc:Filter>
            <sld:PolygonSymbolizer>
                    <sld:Fill>
                        <sld:CssParameter name="fill">#fff5db</sld:CssParameter>
                    </sld:Fill>
                <sld:Stroke>
                    <sld:CssParameter name="stroke">#ffffff</sld:CssParameter>
                    <sld:CssParameter name="stroke-width">0.26</sld:CssParameter>
                    <sld:CssParameter name="stroke-linejoin">bevel</sld:CssParameter>
                </sld:Stroke>
            </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
            <sld:Name>2</sld:Name>
            <sld:Title>10% - 16%</sld:Title>
            <sld:Description>
                <sld:Title>10% - 16%</sld:Title>
            </sld:Description>
            <ogc:Filter>
            <ogc:And>
                <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>level</ogc:PropertyName>
                    <ogc:Literal>Commune</ogc:Literal>
                </ogc:PropertyIsEqualTo>
                <ogc:PropertyIsGreaterThan>
                    <ogc:PropertyName>tx_pop3044</ogc:PropertyName>
                    <ogc:Literal>10</ogc:Literal>
                </ogc:PropertyIsGreaterThan>
                <ogc:PropertyIsLessThanOrEqualTo>
                    <ogc:PropertyName>tx_pop3044</ogc:PropertyName>
                    <ogc:Literal>16</ogc:Literal>
                </ogc:PropertyIsLessThanOrEqualTo>
            </ogc:And>
            </ogc:Filter>
            <sld:PolygonSymbolizer>
                <sld:Fill>
                    <sld:CssParameter name="fill">#ffeab3</sld:CssParameter>
                </sld:Fill>
            <sld:Stroke>
                <sld:CssParameter name="stroke">#ffffff</sld:CssParameter>
                <sld:CssParameter name="stroke-width">0.26</sld:CssParameter>
                <sld:CssParameter name="stroke-linejoin">bevel</sld:CssParameter>
            </sld:Stroke>
            </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
            <sld:Name>3</sld:Name>
            <sld:Title>16% - 20%</sld:Title>
            <sld:Description>
                <sld:Title>Communes 16% - 20% </sld:Title>
            </sld:Description>
            <ogc:Filter>
            <ogc:And>
            <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>level</ogc:PropertyName>
                <ogc:Literal>Commune</ogc:Literal>
            </ogc:PropertyIsEqualTo>
            <ogc:PropertyIsGreaterThan>
                <ogc:PropertyName>tx_pop3044</ogc:PropertyName>
                <ogc:Literal>16</ogc:Literal>
            </ogc:PropertyIsGreaterThan>
            <ogc:PropertyIsLessThanOrEqualTo>
                <ogc:PropertyName>tx_pop3044</ogc:PropertyName>
                <ogc:Literal>20</ogc:Literal>
            </ogc:PropertyIsLessThanOrEqualTo>
            </ogc:And>
            </ogc:Filter>
            <sld:PolygonSymbolizer>
                <sld:Fill>
                    <sld:CssParameter name="fill">#ffdb7b</sld:CssParameter>
                </sld:Fill>
            <sld:Stroke>
                <sld:CssParameter name="stroke">#ffffff</sld:CssParameter>
                <sld:CssParameter name="stroke-width">0.26</sld:CssParameter>
                <sld:CssParameter name="stroke-linejoin">bevel</sld:CssParameter>
            </sld:Stroke>
            </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
            <sld:Name>4</sld:Name>
            <sld:Title>20% - 22%</sld:Title>
            <sld:Description>
                <sld:Title>Commune 20% - 22% </sld:Title>
            </sld:Description>
            <ogc:Filter>
            <ogc:And>
                <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>level</ogc:PropertyName>
                    <ogc:Literal>Commune</ogc:Literal>
                </ogc:PropertyIsEqualTo>
                <ogc:PropertyIsGreaterThan>
                    <ogc:PropertyName>tx_pop3044</ogc:PropertyName>
                    <ogc:Literal>20</ogc:Literal>
                </ogc:PropertyIsGreaterThan>
                <ogc:PropertyIsLessThanOrEqualTo>
                    <ogc:PropertyName>tx_pop3044</ogc:PropertyName>
                    <ogc:Literal>22</ogc:Literal>
                </ogc:PropertyIsLessThanOrEqualTo>
            </ogc:And>
            </ogc:Filter>
            <sld:PolygonSymbolizer>
                <sld:Fill>
                    <sld:CssParameter name="fill">#7ccab2</sld:CssParameter>
                </sld:Fill>
            <sld:Stroke>
                <sld:CssParameter name="stroke">#ffffff</sld:CssParameter>
                <sld:CssParameter name="stroke-width">0.26</sld:CssParameter>
                <sld:CssParameter name="stroke-linejoin">bevel</sld:CssParameter>
            </sld:Stroke>
            </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
            <sld:Name>5</sld:Name>
            <sld:Title>22% - 25%</sld:Title>
            <sld:Description>
                <sld:Title>Communes 22% - 25% </sld:Title>
            </sld:Description>
            <ogc:Filter>
            <ogc:And>
            <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>level</ogc:PropertyName>
                <ogc:Literal>Commune</ogc:Literal>
            </ogc:PropertyIsEqualTo>
            <ogc:PropertyIsGreaterThan>
                <ogc:PropertyName>tx_pop3044</ogc:PropertyName>
                <ogc:Literal>22</ogc:Literal>
            </ogc:PropertyIsGreaterThan>
            <ogc:PropertyIsLessThanOrEqualTo>
                <ogc:PropertyName>tx_pop3044</ogc:PropertyName>
                <ogc:Literal>25</ogc:Literal>
            </ogc:PropertyIsLessThanOrEqualTo>
            </ogc:And>
            </ogc:Filter>
            <sld:PolygonSymbolizer>
                <sld:Fill>
                    <sld:CssParameter name="fill">#3d9b9d</sld:CssParameter>
                </sld:Fill>
            <sld:Stroke>
                <sld:CssParameter name="stroke">#ffffff</sld:CssParameter>
                <sld:CssParameter name="stroke-width">0.26</sld:CssParameter>
                <sld:CssParameter name="stroke-linejoin">bevel</sld:CssParameter>
            </sld:Stroke>
            </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
            <sld:Name>6</sld:Name>
                <sld:Title>> 25%</sld:Title>
                <sld:Description>
                <sld:Title>Communes + 25%</sld:Title>
            </sld:Description>
            <ogc:Filter>
            <ogc:And>
            <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>level</ogc:PropertyName>
                <ogc:Literal>Commune</ogc:Literal>
            </ogc:PropertyIsEqualTo>
            <ogc:PropertyIsGreaterThan>
                <ogc:PropertyName>tx_pop3044</ogc:PropertyName>
                <ogc:Literal>25</ogc:Literal>
            </ogc:PropertyIsGreaterThan>
            </ogc:And>
            </ogc:Filter>
            <sld:PolygonSymbolizer>
                <sld:Fill>
                    <sld:CssParameter name="fill">#2d4059</sld:CssParameter>
                </sld:Fill>
            <sld:Stroke>
                <sld:CssParameter name="stroke">#ffffff</sld:CssParameter>
                <sld:CssParameter name="stroke-width">0.26</sld:CssParameter>
                <sld:CssParameter name="stroke-linejoin">bevel</sld:CssParameter>
            </sld:Stroke>
            </sld:PolygonSymbolizer>
        </sld:Rule>
    </sld:FeatureTypeStyle>
    </sld:UserStyle>
    </sld:NamedLayer>
</sld:StyledLayerDescriptor>