*** |  (C) 2008-2021 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de


vm_land.fx(j,"urban") = pcm_land(j,"urban");
vm_carbon_stock.fx(j,"urban",c_pools) = 0;
*' Biodiveristy value (BV)
if(m_year(t) <= 2020,
        vm_bv.fx(j,"urban", potnatveg) = pcm_land(j,"urban") * fm_bii_coeff("urban","y2020","%c44_forestry_intensities%", potnatveg) * fm_luh2_side_layers(j,potnatveg);
        Elseif(m_year(t) = 2025),
            vm_bv.fx(j,"urban", potnatveg) = pcm_land(j,"urban") * fm_bii_coeff("urban","y2025","%c44_forestry_intensities%", potnatveg) * fm_luh2_side_layers(j,potnatveg);
        Elseif(m_year(t) = 2030),
            vm_bv.fx(j,"urban", potnatveg) = pcm_land(j,"urban") * fm_bii_coeff("urban","y2030","%c44_forestry_intensities%", potnatveg) * fm_luh2_side_layers(j,potnatveg);
        Elseif(m_year(t) = 2035),
            vm_bv.fx(j,"urban", potnatveg) = pcm_land(j,"urban") * fm_bii_coeff("urban","y2035","%c44_forestry_intensities%", potnatveg) * fm_luh2_side_layers(j,potnatveg);
        Elseif(m_year(t) = 2040),
            vm_bv.fx(j,"urban", potnatveg) = pcm_land(j,"urban") * fm_bii_coeff("urban","y2040","%c44_forestry_intensities%", potnatveg) * fm_luh2_side_layers(j,potnatveg);
        Elseif(m_year(t) = 2045),
            vm_bv.fx(j,"urban", potnatveg) = pcm_land(j,"urban") * fm_bii_coeff("urban","y2045","%c44_forestry_intensities%", potnatveg) * fm_luh2_side_layers(j,potnatveg);
        Elseif(m_year(t) > 2045),
            vm_bv.fx(j,"urban", potnatveg) = pcm_land(j,"urban") * fm_bii_coeff("urban","y2050","%c44_forestry_intensities%", potnatveg) * fm_luh2_side_layers(j,potnatveg);
    );
vm_bv.fx(j,"urban", potnatveg) = pcm_land(j,"urban") * fm_bii_coeff("urban",t,"%c44_forestry_intensities%",potnatveg) * fm_luh2_side_layers(j,potnatveg);