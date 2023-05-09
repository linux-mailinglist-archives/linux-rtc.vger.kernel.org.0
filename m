Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC8A96FC431
	for <lists+linux-rtc@lfdr.de>; Tue,  9 May 2023 12:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234791AbjEIKsv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 May 2023 06:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233624AbjEIKst (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 May 2023 06:48:49 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2131.outbound.protection.outlook.com [40.107.113.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13C0448A;
        Tue,  9 May 2023 03:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFYwoL+Mphq2nCjHudZuNrv22GWlVnCqmbAl5YxlFEHxz+zz2ZvF2ffgrOyxV7PBXiYF1tZ6+hwELy9ubcjS0HBjBuFGBlrtGDiUst2fiFdB3sSzRv5C6wmKI4P75Kgdhj31bv5VrhHdAwuN6r6UFnrqOoA7sRm47i9rHjPSFVHZnNk87z+UjzuKBBTpIvVEZOno6QAVxno5XWB0OgIK69k/yFv6hhJwNHJUW/4LvVB7rp74oyh04g0udMqCZMgZKXVbZ/SWyaSOrB4ip0btF+CaoNVi2Ypq6hA3XGu/4KbdA+Bcu+AmZe7w6EZAqDXsuBVdtZ0yWsFijlec3wsQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OF51Ui3NmWg3oxwfA/RbVkduZ8bmwHCzt+aSmsgN60=;
 b=cvV+kqF/FLB+wHRTx3UdQoGh0t7Fuj7LtKGrpP2bPIL2f7wwsFAdJtj7osuw/h/+ldqP/wEfGS9PSr6TwE//sghQIM6dnXXlO5Ika6U/f/AqzwHg7ukDl4fYPXvJZJewGrKENYB6oAQg1wssc8q8Z3lm05TA7Hlu2lD2tVCIEE4jIV0e/nKfah+AzIdJcSwak1nvwNMBC2o1d2k2vxGNnv7kcuJjja54bXfruJkK9UVvzVyx0NR4hCvANfaaATRGQwqY/CICk+Njy0+T19Jpt4ZC8F8/AqUDm9Y9ppZVM0ioKvhck0i92IY/r04M26nE0vGigSLmhqx70my/NjPMrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OF51Ui3NmWg3oxwfA/RbVkduZ8bmwHCzt+aSmsgN60=;
 b=GrVaubVKS9qyofC8JzBSw/NwOnU1cRnEyLHmg6NTzcTDV2d138ornOSUtxM9AzjIY1qRQ1JvBcY8gKEYKDjep/5IFi/fqnhNG9nyg0KdD8ym4tPSYjAXJ01PyYYfIXHQNSfeBHp91hxIa7nRLsqSHwPCB7yiBzv98Y8+MTs9A94=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OSZPR01MB9564.jpnprd01.prod.outlook.com (2603:1096:604:1d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 10:48:45 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::831b:77c4:7538:9f90]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::831b:77c4:7538:9f90%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 10:48:41 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Trent Piepho <tpiepho@gmail.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3] dt-bindings: rtc: isl1208: Convert to json-schema
Thread-Topic: [PATCH v3] dt-bindings: rtc: isl1208: Convert to json-schema
Thread-Index: AQHZfzJr42RpKKJro0icas0vK/wZeK9L+2iAgAXM/kA=
Date:   Tue, 9 May 2023 10:48:40 +0000
Message-ID: <TYCPR01MB5933076BBF16DB7FE20F56C186769@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230505091720.115675-1-biju.das.jz@bp.renesas.com>
 <a55c7ac8-1037-4509-a16e-83c7894b1a4d@linaro.org>
In-Reply-To: <a55c7ac8-1037-4509-a16e-83c7894b1a4d@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|OSZPR01MB9564:EE_
x-ms-office365-filtering-correlation-id: 9a9b3205-7b5f-42c5-719a-08db507af3d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vHXLihvcyuGBAlDwad7Hqt/2INLR5mIyahQOZMRMY733hZvid/XKbFxYF4jENNLolLdG5qZejOJxSxIZn7I+2L6U1KaPKOOBO7mlUda+c/a1obi5xU77IDb0oWOPah6imdlA0nPpMqAhqWRtHyBVq3aRGvnntv68Djp86ifB9e3Qa3g64eH/9GIMkIcidKWQFlrjVqAhLASMxnkOJ4libOuFZbRS4M8cHiWpT9T4OewfTzeH6E9JRvURWRDjRYqhxpUg/AIQ1KspUIcgyD1SY1SPhPNyER7YFCJcjp+tpVqrhHBG6Igel/EOam89qocn+bH7LGgqn0ld+wCOC/R1Y/gN/EOz0TG1KJjHbnkNAfIcFa70ZL4Rlygii4H8l2mqcHL/9avozQXpSYGrzvpItAQBQH9F0BItMh2AztV80cBmiFt4i+7MgahGDa+6MNOqxEGF3NrS3WmmESZCys8lILVF1pMcorD0et9/hiyqZ2ACoVftn/OzFikW2Iq5jp+m3YA74GyYRZHR1Tx9fZoSGwRTSFNnOhVpTNylCeb0UHoR2UY2KYHoU4r2e1H7hXiAnDLTN1BxRqEnxLdtYj38MIwEO238IvXQTUQf1cwTHnhRFH7KjAI9uPtHr5znW42jz3fHfak5+yDplcQKqBlj+wzvLy4+Qy9wiusToCrB4+0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199021)(76116006)(66476007)(66946007)(64756008)(4326008)(66446008)(478600001)(66556008)(71200400001)(7696005)(316002)(110136005)(54906003)(86362001)(33656002)(83380400001)(9686003)(6506007)(53546011)(8676002)(8936002)(52536014)(5660300002)(41300700001)(7416002)(2906002)(55016003)(38070700005)(38100700002)(186003)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AoSNQM8kYtxwF8HPR5Qv82pZIIcsKRCCSq+hPG6u/NlfL+heodm79l0gOvLi?=
 =?us-ascii?Q?mX7gibLelHQNLDj4dP+wtutd3rUoedneZKnHmwfVSwnIZNd2IXg9v/i7PiJ+?=
 =?us-ascii?Q?S9hCOk9oqAYxNN0zYRBqB1wHSxL4XfiYUKM1yaIURKgu36ZtwS8tO6JlGsik?=
 =?us-ascii?Q?KQCPhEaDNXcDy5yyqcQPZtyF7A13sFaTLAJaP6hO+zRNYWOaNfpXURF3c706?=
 =?us-ascii?Q?aI7/PAo2E7ln9jBSami1FlHAscPtznYP1Hj8sjEqSnqfitU0NFbBZEbXKW0J?=
 =?us-ascii?Q?uopOXMLIx+5yTiyHDxD45qwcuJrYGST7NP2dStlbTN5FiRtlMSMnnPp1isUD?=
 =?us-ascii?Q?Am9/ICEHfl0/qODXELl8Jtlr5KFrf0jCFYM80IAsOJm8uNb1bSgEDE7XsaLT?=
 =?us-ascii?Q?iAqyxHnI1dFseyyEhcuP8cqciYLXqk6lHR3415m3oP5YXWhTZpyZM0JRPcT6?=
 =?us-ascii?Q?wIJANEMsLGm3TQFUD8ZykDGECPKBnpeUXDRvXWkZs/QTmUdXzr74M7Ypp+4a?=
 =?us-ascii?Q?in5kHk0xYF1bHloxaglWvOfyShPyh2jZKTWRQEhWom3kUdsu6gc0UpTHyW7e?=
 =?us-ascii?Q?b8SnfBYborLJP0fvI9i3m1NfN2L8s6/qf8OVf7i6WwaG/3KWiq/NMc5yFFJo?=
 =?us-ascii?Q?rptqQZPRR5QA7AazKNXg+X1vxCXBa2DIqSUWm1OfreMZ3iqdJlesr7QAZovR?=
 =?us-ascii?Q?AtDjQeXjkXtz2i/DSF+Q7b9PE+z5HlVMN9NXYiTpd9pc6RYvK8gJjgCRqAlQ?=
 =?us-ascii?Q?xIexngpdJy1fPm65KTdMT1yb/fPgeJwAVrfy26U7IpulMM1FtQ4MIePck7f6?=
 =?us-ascii?Q?XqoHDIzwLfwS2Tp8Y5zsFanqfT0t02welQWwDNvD25hROHDDf3hqufJ5tm9E?=
 =?us-ascii?Q?xWLnsh44uHrlD46rUCALX+6u21/FIVE4yXL1OIky0tXSLrDFXmKqHkDeqHzw?=
 =?us-ascii?Q?pjJlKcXE4ZVOsHueQyfOfX95GHtNzIw4T/vuu0MDs5AfxwnXgNEDp6LAkVrh?=
 =?us-ascii?Q?9Jlv2aBPJjh4cnK+nRpTbEurJOEcLCaOw48CyZDFuBWpqrcnu+9HgOKxhz8N?=
 =?us-ascii?Q?gXgf2Z+3xG6Fw9rUzUo5fSQMQ3ELeIR6bX0FqxSo6z5EugKo3bn0gl8byfxr?=
 =?us-ascii?Q?P0LtRRiaKC/5X6ZJxG/acM5fHMFHFbKeXOoOaXawkZ7J9Ryo3Q2Prbbvn5K+?=
 =?us-ascii?Q?IfzSJR9CnWXSbsL0YITK2Jrs2wdetKoVAL8Ml+PLXvUJ4FvDq6m2viIXWqMZ?=
 =?us-ascii?Q?ZCNI36NDDLWKuSenyMY5mPsG0k8kw75zKZPu1pU/l87qUVCPmGr5B7hCR7Zo?=
 =?us-ascii?Q?LclJWF3N22K+g1dEA1fu3VGBCMW41GySNlwbNElMyRPBtS0zRwXKMAiuZram?=
 =?us-ascii?Q?9jqkmETdGISVdDvIxOTA+c0zuEE+niSnOJMT8QTsXn6r76id0Wiq+Y9f/dlO?=
 =?us-ascii?Q?ijlSRR/FwyvDoZT8vqcfTKVrhSs+tkDeFx7iK30z1ixG8k2cUwIYrvvK4jMH?=
 =?us-ascii?Q?invGqlXOoInIUY/pSH/YGdynzZy9j3o2B/LDyATYh5vdareGEzXO82oAbPqU?=
 =?us-ascii?Q?jAHt2XeusdF9bTYtByk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9b3205-7b5f-42c5-719a-08db507af3d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 10:48:40.9605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q0mkbQdAw/R2Y7WRVl6h3V6Ff4yj3VZ/5a6uO5PwP3Z+3ib72Q8XHsL4molK3DhZS7OSUooXkVLgCLkBUfPM7OTQKhl9mZvQRybfjQ1Mn14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9564
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Krzysztof Kozlowski,

Thanks for the feedback.

> Subject: Re: [PATCH v3] dt-bindings: rtc: isl1208: Convert to json-schema
>=20
> On 05/05/2023 11:17, Biju Das wrote:
> > Convert the isl1208 RTC device tree binding documentation to json-schem=
a.
> >
> > Update the example to match reality.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Thank you for your patch. There is something to discuss/improve.
>=20
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +
> > +title: Intersil ISL1209/19 I2C RTC/Alarm chip with event in
> > +
> > +maintainers:
> > +  - Trent Piepho <tpiepho@gmail.com>
> > +
> > +description: |
>=20
> Do not need '|' unless you need to preserve formatting.

OK, will remove it.

>=20
> > +  ISL12X9 have additional pins EVIN and #EVDET for tamper detection,
> > + while the
> > +  ISL1208 and ISL1218 do not.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
>=20
> It's not oneOf, but only enum.

OK. Will fix this in next version.

Cheers,
Biju

>=20
> > +      - enum:
> > +          - isil,isl1208
> > +          - isil,isl1209
> > +          - isil,isl1218
> > +          - isil,isl1219
> > +
>=20
> With above fixed:
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> Best regards,
> Krzysztof

