Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A969729C2B
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jun 2023 16:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239211AbjFIOE2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jun 2023 10:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbjFIOEY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jun 2023 10:04:24 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9259E1BC6;
        Fri,  9 Jun 2023 07:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686319462; x=1717855462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NRBfHD/6pEpjkFG2oKWveB5W2AWXlcZfQ9xyk1RhqhY=;
  b=VkgTTjgstvhVtv3tZRtsAd5g7cUMj+Mm10c8KE/PpvDltiHgs3ObBPH3
   Vd4tLFrfbvHyK7H4zQd1dV1dZ2oRV4Ri5MCNzjOSotqv/6+jHJABtG7mW
   EXb9PFijcEsRb/yMo2g0rOt2Rg12XGRc1BdB8xXMWPNeT57M+hsaKmYZK
   O++yuT2+mkimeDrwUQpNUCJcwA2WBm4KSTkgTpWIzt/YA2eqIcj3a3kh7
   obugOA6N0hruUrXUcMZSFZuutB49E1FDnPbjp+z/h7cisIBb5slrFFAw7
   pdBE59nK9G4eu7rBxT2v6P5zJ58187VJbz+ZOrXFKF62pG8gKSGU/32VZ
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="asc'?scan'208";a="219601371"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jun 2023 07:04:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 9 Jun 2023 07:04:19 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 9 Jun 2023 07:04:17 -0700
Date:   Fri, 9 Jun 2023 15:03:52 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Trent Piepho <tpiepho@gmail.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v6 05/11] dt-bindings: rtc: isl1208: Convert to
 json-schema
Message-ID: <20230609-chalice-parasitic-14b7868f6aff@wendy>
References: <20230602142426.438375-1-biju.das.jz@bp.renesas.com>
 <20230602142426.438375-6-biju.das.jz@bp.renesas.com>
 <OS0PR01MB592217A7291027A7C27C17268651A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <202306091348319ef75d62@mail.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2Zsjy79XFfr7ZGEp"
Content-Disposition: inline
In-Reply-To: <202306091348319ef75d62@mail.local>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--2Zsjy79XFfr7ZGEp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2023 at 03:48:31PM +0200, Alexandre Belloni wrote:
> Hello,
>=20
> On 09/06/2023 06:42:59+0000, Biju Das wrote:
> > Hi Alexandre Belloni,
> >=20
> > Is it ok, if I send isl1208 driver enhancement patches patch#5 to patch=
#10,
> > as it has no dependencies?
> >=20
>=20
> I was still waiting on a review from the DT maintainers on 6/11 to apply
> the series.

It should have one, no? Although I am new as of -rc1 and the information
is unlikely to have propagated far maintainers wise.
https://www.kernel.org/doc/html/latest/process/maintainers.html#open-firmwa=
re-and-flattened-device-tree-bindings

Cheers,
Conor.

--2Zsjy79XFfr7ZGEp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIMxSAAKCRB4tDGHoIJi
0iCeAQDD2TEMdCOfrDVQOehJYVDMhyr9+0ZQnAHJbte3VgXQGQD8D6Z5x1ntWtFU
OLBUS4WwcVv7iX9WPIvAlPovvpuvnA4=
=Pr/3
-----END PGP SIGNATURE-----

--2Zsjy79XFfr7ZGEp--
