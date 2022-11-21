Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1116A631E5F
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Nov 2022 11:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiKUKax (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Nov 2022 05:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiKUKaw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Nov 2022 05:30:52 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2072.outbound.protection.outlook.com [40.107.22.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09509178BA;
        Mon, 21 Nov 2022 02:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jkf1WuFcXbmoMO0FRYbG2mTU+5gASQJ4AZ45XqIDPuYVEVDNJIg5eqRYZeJ32NJuGUkrE1LtimtuCV/WApvQNBLZDtCx0T3d/XQKa+iN0++ite1LClrUlps3HWIUrq3GfoIh23/VC6MNqquUW63EIMSGiNQPFgt0G9dJayCofJ7Wb7J7GynBz4ybtcwUKiTm+ggXtM95WWP2IJyi8lFh2RcGE3L7CT6UmyRC10N0s27XsTorhPd+m+nYBeHhDllc77cXHoNXgYvzt6wf++LGAQHX0pKErRuN84EZ7DweFY0F5LJ7GpDLdq1sfMtEdZVo4MxJ2XKDgbar7uAiDSmGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HACVA9i0aPdKjGkT4z+IeeYh7Mm9vIkZM+AKJkc/wRE=;
 b=TERAbTABSjnR4QZlwyExqyrnwQIYPaSG92DQ3UqSKqdtl5p8eYH/D3vyFHRReUp6W7DQLYcwlzNcIsDertc54iJ0MJxheMpmPiKi1egYBjRLDB1eVy1OGvQq0+W5OVgH5XKrgl5g9R4rPGyhlDgYrJT02Ozm6hPJpkidg/0VcuusAbFpXgKKiH/am7QSxe+tyAYjycDX3x4SMUWRg8kf2gh/2sKcO9w5WQ0PFKAOhNjo3xJddVXgD5MCixYXZhuZ01/8JtDxGRjtw1fWk7zdKEivlknBdovgeatdSiBbakn1Kt4UtO4B4vN6L6/e04vSLqetPxhLuyrlvYcW3Lwevg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HACVA9i0aPdKjGkT4z+IeeYh7Mm9vIkZM+AKJkc/wRE=;
 b=kYRB639lxVIrdsHFzKzDZ2uT4rKyrdkCcPUrAAG6922wfu8a/96QSGJaM4KP/+veXARG6AjGEA1BevOWOYnadK/g171EY/KzwRguq8SKfB4tC2Nxy8Tln/d2A62J1Zhh3tETruboYJV7NfG4eZKPmkjfKYsMiU3qUz+AE+chFcI=
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PA4PR04MB9488.eurprd04.prod.outlook.com (2603:10a6:102:2af::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 10:30:48 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a%8]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 10:30:46 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>
Subject: RE: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Thread-Topic: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Thread-Index: AQHY/XWNECi6akMI70mG4aJ99Q3psa5JGX+AgAATEHA=
Date:   Mon, 21 Nov 2022 10:30:46 +0000
Message-ID: <AS8PR04MB8642CE4F0DF34A998FBDB50E870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
 <1d93e843-d7bd-a4f7-bb99-4270d9333fa1@linaro.org>
In-Reply-To: <1d93e843-d7bd-a4f7-bb99-4270d9333fa1@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|PA4PR04MB9488:EE_
x-ms-office365-filtering-correlation-id: 2524ab88-44af-4d6c-9710-08dacbab7363
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RVzQ0ZoKuM+ZCu+C+ACV9XoSTBcCvRSGVhbmGQzx0HLH4V+rruA/SoWAXUEZZj4az+pjkBWvXbFy8Ao+Bruu9Z+FRFZ/6x2SajgYxBb4gmd7Y+dP33q9Een8yQN+tKaSuBpHuVg/lBTkxnt1XAKRF/aj7QWSmkbcJ7x+fXQqmRkUcPUkWqhsItX4reC2iU+8yrUdlsUGFZY1oD3FZ64F2gogCtzcofxlPY7U8BjS1tdiiwSDR7FmHQZSSrFjxMJj4IqXKhqrSyufvJeTf5JSL5uH8TJga9SEevHsUE3ptaU1J1fiWyFCf2+qZhqRHRWxswD8wsSgd2ablDhdNrUz8slr02JXThMg+C7nJNIcVQkYbLCo9jBn9g4O00yMwezSQoduLzwJGOLNgm3gYNNqfzcAKUj96Yj9+agLFnU5Cpz4HVSCuL40DJtjlOQ6/IVur7Jd3Q0gHzhLSZdIYeFxXoOOKbXrlumY0zXmyDxUsn+ppOlWeYj89YUYSPRxZN7pcioUr2aG/d3XzEmp34IlnrqYV8GxGX86fCJ/k+hzedah/KugfIhLaeXSqvY2eAVXfR3GhcV0xv95LyP/hQnxjQdK8rRMYIPj9iTWO10ra1tL9mJBAJCqA45nNmGPHbCcaLarXp8sooBNbWKfWQ+qMgaVLr+JXPywLn+c3NvvO1+YyDJHu27vim8/TA5EMH8ywT5n0qlv+KmXycYQ2KooxA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199015)(478600001)(71200400001)(38070700005)(6506007)(110136005)(53546011)(7696005)(86362001)(26005)(316002)(38100700002)(2906002)(99936003)(122000001)(66946007)(76116006)(66476007)(64756008)(4326008)(66446008)(8676002)(41300700001)(66556008)(54906003)(8936002)(52536014)(186003)(9686003)(4744005)(5660300002)(7416002)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e/9IHrqWSmOMgu8YfPQTsVTi5gUsCRVlDR2gzlX+bS68cJn3QvsSOR74EkX7?=
 =?us-ascii?Q?YH2lZPTWxqqQ0mZ0UWoqv/79mPYHworfW9oxC8csG/RFDTuN1rrZ4U1jEq0R?=
 =?us-ascii?Q?Pgeon8Ju2ko7lawm3eNIczXqtp84uoL/iT+/zP/Tkx43Lro6s/QiSZVCkaXo?=
 =?us-ascii?Q?jEZPOOA9FyTl/ofM2KhsIoQW+9ZG1Vl48pfa3UrrWYquvMHnN5YS/8Jx94qh?=
 =?us-ascii?Q?p3AwTeVonRo7/UA5+Z5uCEfdYL7WSlWVMjqOnlKjO+asJrWKdXZV04QzdgTo?=
 =?us-ascii?Q?S66E9cDxTxpbZ43CV6hli3MmUE1NQuP1bGM8Wk2XCfw6mp2AjKXIkOPwSywD?=
 =?us-ascii?Q?rlOJ+JYhfBeqZ1Bl9BKv5rerf1NgOQonLjenYA51/j6gPChk9lO2MfouRK5L?=
 =?us-ascii?Q?AD4L2kyjs+hs3NnKgHjl6GKxdTadlXCC+CNltyZ9EjVhqdIzACi7+Q2gzhwf?=
 =?us-ascii?Q?iWhdW2NRP2ml8XazJMjXwfhS3L0Ka6IYKu1n/dmebLr4HLQcfzlefEmK0T8a?=
 =?us-ascii?Q?i+2xBvMEca6HZpGrdj0lVDHvNNNeKXxsAPcJiJefjuHsBjEUh6urDAQwaOW9?=
 =?us-ascii?Q?uzCxCox7j2E//1co/yzf4pZeir2IseflDj14LT+CnxfdOHCxWYS6hQeXQCa5?=
 =?us-ascii?Q?ogs7oK/n13688KIVQfFebdhc292X/lt7jRNX+3eVVYKPW68m7ExBasn0y+tB?=
 =?us-ascii?Q?iS6BdGV4a3Tlqt0Xk6DkJ32jW1EBF6Id0PKENrsMgfsXZAwXtIfTirZtiE9G?=
 =?us-ascii?Q?X2uyj2uz/fnIk7hVclkqHCq7r2CbkvcKj0IahLM/aElY5d1QL1uLc7hRnpe7?=
 =?us-ascii?Q?fWdy016rpyRdfStkMHrX+r8Zpau3KxMNKALcWE22tFsJ8Vgq/sZQ0vR+Ix4J?=
 =?us-ascii?Q?ud5UKeYqMdTHUVHopDcHPJDmgcEMtdhq2XM7lP2ZnltGysaqv8jU38Uquv7U?=
 =?us-ascii?Q?Q5xWNuS3VNiJSftkL+7Nj0qlN3Z8laEQ5YoMJXG82a3H09erfm26o+GW+amx?=
 =?us-ascii?Q?7IPL+no2yBJGz2xX+cTQt7MsfZ6nMbIZU8/kx6QosutED9XRqlFmS5n4tJFE?=
 =?us-ascii?Q?dmvlqzex0phMp7DHNqaaGpp7HLJ2WdniJofId66Sbtecze9Dd+km0xj7kv+5?=
 =?us-ascii?Q?+OIyH5brwLfHAEWaEtW2vJK9Fj1RmY+mv9PDxuUeT/I+sKrZVKYuQqKAPXNm?=
 =?us-ascii?Q?mqcWYmMKz8cEPP2EizhiWKIviPAKLcQYh53ynPR6AKlShggEvp7jJWfcDlji?=
 =?us-ascii?Q?+NbDjMO/gDlzlxtky28113pPwKJ8elpnvoX0OqE8oO5UuezBEPKna1UU9NUl?=
 =?us-ascii?Q?4/xjesIQ8wO0sW/OGASSCdOxUR5Yp66KpZlZQwPLNYBnkFzK/ABy8jslOMje?=
 =?us-ascii?Q?cDibvQ1DxiIlMcWYLZWUlK0dAwHlwfUTnXHVC7sbUgzsOmdJ92j1vd1Ko+RJ?=
 =?us-ascii?Q?hUsDMt1bt/RFAqZAr+nAcO+ltAhMC3pAUZoxq1YFALtD7zDetoslx9vVbCfr?=
 =?us-ascii?Q?JSAvcP91jtHYS2qZfYFN+TVdmA4usDgss+C67u22V4eYPQRUMgEMYai3km72?=
 =?us-ascii?Q?Yo4ILWN8xbl1DrdMXeQ=3D?=
Content-Type: multipart/signed;
        protocol="application/x-pkcs7-signature";
        micalg=2.16.840.1.101.3.4.2.1;
        boundary="----=_NextPart_000_016A_01D8FDD7.5D6D74C0"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2524ab88-44af-4d6c-9710-08dacbab7363
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 10:30:46.1786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aGKIQMuYUjSmk4Rs/vhbYqoLgn2Ah0r0qlmp6nQ19qRoy0TqaPXYqErHPq9ObGaipNTzcq/y9ldG1UEtlBVFMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9488
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

------=_NextPart_000_016A_01D8FDD7.5D6D74C0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
> bbnsm
> 
> Also few nits:
> 
> On 21/11/2022 07:51, Jacky Bai wrote:
> > Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).
> 
> Subject: drop second, redundant "bindings".
> 

Do you mean the redundant 'bindings' in below title line?

> > +
> > +title: NXP Battery-Backed Non-Secure Module bindings
> 
> Drop "bindings"
> 

Ok will drop it in v2.

BR

> > +
> > +maintainers:
> > +  - Jacky Bai <ping.bai@nxp.com>
> 
> Best regards,
> Krzysztof


------=_NextPart_000_016A_01D8FDD7.5D6D74C0
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

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
U2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNv
bT9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0
aW9uUG9pbnSGL2h0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEVudGVycHJpc2VDQTUuY3Js
hi9odHRwOi8vd3d3LnBraS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybDCCARAGCCsG
AQUFBwEBBIIBAjCB/zCBuwYIKwYBBQUHMAKGga5sZGFwOi8vL0NOPU5YUCUyMEVudGVycHJpc2Ul
MjBDQSUyMDUsQ049QUlBLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENO
PUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y0FDZXJ0aWZpY2F0ZT9iYXNlP29i
amVjdENsYXNzPWNlcnRpZmljYXRpb25BdXRob3JpdHkwPwYIKwYBBQUHMAKGM2h0dHA6Ly9ud3cu
cGtpLm54cC5jb20vY2VydHMvTlhQLUVudGVycHJpc2UtQ0E1LmNydDA9BgNVHREENjA0oCAGCisG
AQQBgjcUAgOgEgwQcGluZy5iYWlAbnhwLmNvbYEQcGluZy5iYWlAbnhwLmNvbTANBgkqhkiG9w0B
AQsFAAOCAQEAkIoVu8Z7nAqHdZlesSa/ZKQsoGVN/KXyw5UDkWZc8QH5EUPRhmwPk4j2IO+7zGl5
X+G5pRc1FmjT5MiJx7HJqWjYauI2HmGU0UtwSTqT+s9286vF5h1AEOLUBSUzB3E/O/cWvpDL3IEe
+stzIGhRpwg6OxDOSb9iHElZoDTqpRvLISF6Wy4ktrom24/n6ePTPb5FlWB1y6OPMAiI25YSb9zW
fWumZL+I1EMZHtie+S5axIcNlXke5UxtPzCF8dxKoviZiTOvR2n3XAQd+qDDPHRsev2Bv30I+T7J
W0qNC2rInm5LczdALMKrDUU//+Uy/XT5IyabR0eufpNuTyD7lTCCCDowggcioAMCAQICEy0ACHtC
5W6zRq9c0YAAAAAIe0IwDQYJKoZIhvcNAQELBQAwgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNl
IENBIDUxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVu
MRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPy
LGQBGRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDY29tMQswCQYDVQQGEwJOTDAeFw0yMjA5MTUwMTA2
NDNaFw0yNDA0MDgwOTE1MDRaMIGaMRMwEQYKCZImiZPyLGQBGRYDY29tMRMwEQYKCZImiZPyLGQB
GRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDd2JpMQwwCgYDVQQLEwNOWFAxCzAJBgNVBAsTAkNOMRYw
FAYDVQQLEw1NYW5hZ2VkIFVzZXJzMRMwEQYDVQQLEwpEZXZlbG9wZXJzMREwDwYDVQQDEwhueGEx
OTAxMDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANNFIocz15YTXOTeRm2hof07RVzy
FI/qsJNt0XyGB/wK/65x2QtQ0HDcdvQj1pEewRA3RgcBAWge8vRYfQd2PCICKlfVXfabIwJfbfU+
p4WdW2cvGzGt4/XwXniyYeZwnL96Z5M+FZ/h/GlIT72K7/woP+zA0wzTw6ga9jLJ1S74Kyfbh+9i
eZ6kjokCEZFKwu1AkryMMpkSsWN96z1IghrCwv2D33WjffHy+g8BG0NQ92zvuLShwVU15VBMed2Z
I30PEta+A20b/ygJ1Yb+631JDoPC8bewk2vPi1u3fjB5T1QDNYKxjts9PSzUsdFapd6hSSAk+Z9N
mqnHts9s6iUCAwEAAaOCBFkwggRVMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRV
hu2FOILrmUuaklY/heaKboS14X4CAWQCATowEwYDVR0lBAwwCgYIKwYBBQUHAwQwDgYDVR0PAQH/
BAQDAgUgMAwGA1UdEwEB/wQCMAAwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDCBlAYJKoZI
hvcNAQkPBIGGMIGDMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAS0wCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBGTALBglghkgBZQMEAQIwCwYJYIZIAWUDBAEFMAoGCCqGSIb3DQMHMAcGBSsOAwIHMA4G
CCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAgAwHQYDVR0OBBYEFIQg+lXF6qukHLDnGFCWIGXQ
7e6oMB8GA1UdIwQYMBaAFFiVYO5OdO9lIqq97RmpK3qOF50HMIIBRgYDVR0fBIIBPTCCATkwggE1
oIIBMaCCAS2GgchsZGFwOi8vL0NOPU5YUCUyMEVudGVycHJpc2UlMjBDQSUyMDUsQ049TkxBTVNQ
S0kwMDA1LENOPUNEUCxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1D
b25maWd1cmF0aW9uLERDPXdiaSxEQz1ueHAsREM9Y29tP2NlcnRpZmljYXRlUmV2b2NhdGlvbkxp
c3Q/YmFzZT9vYmplY3RDbGFzcz1jUkxEaXN0cmlidXRpb25Qb2ludIYvaHR0cDovL253dy5wa2ku
bnhwLmNvbS9jcmwvTlhQRW50ZXJwcmlzZUNBNS5jcmyGL2h0dHA6Ly93d3cucGtpLm54cC5jb20v
Y3JsL05YUEVudGVycHJpc2VDQTUuY3JsMIIBEAYIKwYBBQUHAQEEggECMIH/MIG7BggrBgEFBQcw
AoaBrmxkYXA6Ly8vQ049TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNSxDTj1BSUEsQ049UHVibGlj
JTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9
bnhwLERDPWNvbT9jQUNlcnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1
dGhvcml0eTA/BggrBgEFBQcwAoYzaHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFAtRW50
ZXJwcmlzZS1DQTUuY3J0MD0GA1UdEQQ2MDSgIAYKKwYBBAGCNxQCA6ASDBBwaW5nLmJhaUBueHAu
Y29tgRBwaW5nLmJhaUBueHAuY29tMFEGCSsGAQQBgjcZAgREMEKgQAYKKwYBBAGCNxkCAaAyBDBT
LTEtNS0yMS0xOTE1MjA3MDEzLTI2MTUwNDAzNjgtMzA3NjkyOTQ1OC02Mjg5ODUwDQYJKoZIhvcN
AQELBQADggEBADQRSIt6fqoWHqVz8Cp9E9E/O/wJhHJyaY7bNTVWSVpVptyvbVm1rFmj6xTPxQy2
kZGnpCkDQrQIAhY0P/PQGecdI7HmBUkFqlXrhugCHG9vtbeG+kVjDCecvtlWMPsYqER3ZCzACSFc
HJKvWOZdnEc2yfI3LGkDqVMZWzfc4urLk+1H7sYi4psI8Z6EDbEweuSznBtthG8+jomjtqxGhOy6
Uxvh93xFu7X2efPBxxsno44HnWsLrwkzisI8oItaHPqfcIt2W0nyVjvW6rAI0LduoAhJwLsD9RB4
FYZwB4ain11hWJYlP9P19PmMPdoiKQBqQQvnXcujc/rq2sKm/3sxggTDMIIEvwIBATCBzjCBtjEc
MBoGA1UEAwwTTlhQIEVudGVycHJpc2UgQ0EgNTELMAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBC
LlYuMRIwEAYDVQQHDAlFaW5kaG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzARBgoJkiaJ
k/IsZAEZFgN3YmkxEzARBgoJkiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNjb20xCzAJ
BgNVBAYTAk5MAhMtAAfU7dCrf7iXk2FuAAAAB9TtMA0GCWCGSAFlAwQCAQUAoIICxTAYBgkqhkiG
9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMjExMjExMDMwNDNaMC8GCSqGSIb3
DQEJBDEiBCC/aM9+zlDH5ErWFwzcpdKQ0iLLqCwMg9MM8IpqFuavPzCBkwYJKoZIhvcNAQkPMYGF
MIGCMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4G
CCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDALBglghkgBZQMEAgEwCwYJYIZIAWUDBAIDMAsG
CWCGSAFlAwQCAjAHBgUrDgMCGjCB3wYJKwYBBAGCNxAEMYHRMIHOMIG2MRwwGgYDVQQDDBNOWFAg
RW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQIEIuVi4xEjAQBgNVBAcM
CUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmSJomT8ixkARkWA3diaTET
MBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTELMAkGA1UEBhMCTkwCEy0A
CHtC5W6zRq9c0YAAAAAIe0IwgeEGCyqGSIb3DQEJEAILMYHRoIHOMIG2MRwwGgYDVQQDDBNOWFAg
RW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQIEIuVi4xEjAQBgNVBAcM
CUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmSJomT8ixkARkWA3diaTET
MBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTELMAkGA1UEBhMCTkwCEy0A
CHtC5W6zRq9c0YAAAAAIe0IwDQYJKoZIhvcNAQEBBQAEggEAIwShRakO+q1nHrB1d491ULQukAhO
xQyg7YlndV4S8eI9NiDWHdzFGYmL8hcPBT2voiH3pYi86pCr3bkz5eaoupueSJBFaJhgmKGtxhv2
hiBAp8aozD/IBCsQqJzYkHs7qZ4rusx9yPTXEARBnOdkXKT4ewk6JB3ur9CJZoao85rp+IEY/RwN
m9qZwhRYPVd/7rX1WSvaQwIhdHByqEjgw/7GVjR1wSbAD/g0rtz/VxhdDgfgbidXhqDkAs6Kco/h
+VL5/iHmFRC1u2b5mfKfAr3v4BHJxN6bJZ/80C2ncLTjpqOZ9ReSaNkmO6/f+c8JVSaHXlmc1YYO
N7Z/eu1MpgAAAAAAAA==

------=_NextPart_000_016A_01D8FDD7.5D6D74C0--
