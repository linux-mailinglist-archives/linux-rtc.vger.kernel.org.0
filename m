Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B44966FC4C9
	for <lists+linux-rtc@lfdr.de>; Tue,  9 May 2023 13:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234625AbjEILTQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 May 2023 07:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235159AbjEILTI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 May 2023 07:19:08 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2135.outbound.protection.outlook.com [40.107.114.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99FA7ED8;
        Tue,  9 May 2023 04:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBMbVhjIFX4Cp8aW+wI5uiAs/dJIPYbA34Mfd7msorLlI9qhMQMtqy6NY6o15a8RCXlsYxyCv4VypXt719N3Bb7zg5AEMgJ3ASOOGUy6x0ApQ6Iun6fRi/4WlwqAUwRBBRV25CfMz+3YWnaFgZ+lNOOAj05zGn0cipQ2e5sNx0LfJgagO8ycuO3bGWagXSKdTUC82mMrFNAgADPAHraUb9OErK9K+bzA3J0sy6mjDN6jNfHOVpbQJ97C23W3HiHgC0sOgjdDAvgCw4UYxMm39ySMszOXUCQE0JJpSdiPjTAD/v7oTUDuLxporUYGuG5r6qyaceY+cGfPsQg4mA6JhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UEKpNjLg5wht0prL2/jIE2NXNu75jSlC5GO3KnVUlg=;
 b=JMykB75gv8caIQtwxTDs+SR7hPYu+Yv1jWGGj4wBpqGznknsrMMYMlelcpkos2Hw99y5nDY2yb1M6AZvh4oozssISLMG4zGYebmn57FD1CKPTMIk96/dGgXnXRBk6U/icIRqvyA75TL4rI8SPAzFqYlWk4RQFUWwBJ3GU1QNZuFTOYr0OpVSJuSjtV7pZl6p3jlzKidcqMSu5z7sVmIRGJ7n1OfiEMGwmC73PxCOHYfvOUkkFYdqSK6qwE+uvZYyOCI5DwWx8qNstuCz9EZZEG9pePd21CVTH+J/Cta8c87Du0jIg6NW+i5eF3ljnLg0yyhrU/5/NJMPNpBt2ymZBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UEKpNjLg5wht0prL2/jIE2NXNu75jSlC5GO3KnVUlg=;
 b=GrPYOpHOSg1QwHpwd+r4NYxW99rpqNvAn4WNakL7HxczLNim8uAM5D7QUoce99vTBHXttO2kE2mga38ZIDQYSIeoGltKcy2gLsucCpy0tPBwojO/P3oHlXR0qNROpemMPdQ7JSUgl6KlJCcSfLCO7IQksAjUSmBDl7TLUT0b+F0=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OS3PR01MB9380.jpnprd01.prod.outlook.com (2603:1096:604:1c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 11:18:32 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::831b:77c4:7538:9f90]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::831b:77c4:7538:9f90%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 11:18:32 +0000
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
Thread-Index: AQHZfzJr42RpKKJro0icas0vK/wZeK9L+2iAgAXM/kCAAAhs4A==
Date:   Tue, 9 May 2023 11:18:32 +0000
Message-ID: <TYCPR01MB5933CCFDDD9F1454BDE852E586769@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230505091720.115675-1-biju.das.jz@bp.renesas.com>
 <a55c7ac8-1037-4509-a16e-83c7894b1a4d@linaro.org>
 <TYCPR01MB5933076BBF16DB7FE20F56C186769@TYCPR01MB5933.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB5933076BBF16DB7FE20F56C186769@TYCPR01MB5933.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|OS3PR01MB9380:EE_
x-ms-office365-filtering-correlation-id: 25b2d684-8c15-4589-7c7d-08db507f1f67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NX3n7GC+labn0f4W1Gv0n0DbekZ8qvv+ZY946bC3mEO6LIYVPuK/7TWcUBD0ux9L2/JYgYTZHkWYeqdncm3GBgjwKQKCLxCuzs4mqzqtvpMtP7SudMEDsKd0+NoIFpmOBEQfk9iQWoIAqfyXTBmKY8sZCRLqQd0ua3KU2F8AFRCdd2VPFWBhWKsv/5IJoqQ4QKL64RyN38lgkUFTygoXa+a3H9AjqI5dRyraETqg4rBm4B8bjoP9PgmWIZWHiKv97yE7F/NfzRXF2IxpG+1AnB2vgM+qYLCu+pGuwVPWGfEqNDLO4VemcmrLPc/+gcKl1geFHfRZC8k7dK+ot62e6VYv8YH0Hlkt9bb0Xq1z3DVqT0SwuPOji1+WIqXTbcO6EHxIdNE/WJtiMRCXAxZBXBFd4cVcKfNDrGWu1Xk8jKO+tkkaN6DdhwfiCuXOuRRZsZO1Vn8a0i0v2cuzWncprAfWxhpoMx5LNu+StnqmfnOsN+K7HF7Z203/ox0nPHqzf4gNwfrrAVMT/fab4UYUawL62eMrnKROcpZtlTf9h3Lo6agsO+mQAsBJsPYNHlGZ4Qd8Z7rsHrSpN5OnnbcYyTfeIP3xi+mozB3SOQa0/Dcie7M5EPloCrozb5SWZAXI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(38070700005)(478600001)(83380400001)(110136005)(7416002)(41300700001)(55016003)(4326008)(52536014)(5660300002)(8676002)(2906002)(8936002)(54906003)(33656002)(71200400001)(122000001)(76116006)(2940100002)(186003)(66476007)(7696005)(9686003)(316002)(64756008)(66946007)(66446008)(53546011)(86362001)(66556008)(6506007)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Pr3K8wRXYb3Terv//p+0qY8E+5bGWu9/y6f7eLlYhys5qNCfk1aIHy9OoWX6?=
 =?us-ascii?Q?ZppRWSurGUWPg0SCWA8EuPJ4glq7goUx2m0t4qqzhVv0PZhsex4MtneGwFXI?=
 =?us-ascii?Q?QDlOa1BZVW0JlZx33tYczseh6HTPgaXG7ZLW634wyqOB3AQupzvGsNNBNOY5?=
 =?us-ascii?Q?K6saqHpcxfo2GySK4glNXdIWZ9DWtqQ3b4wUkqGBXaSsKed2+vRbg1MS2Ysy?=
 =?us-ascii?Q?jSpXiIJhk6BW1EGT9FsHjuKEwo+hUakOzvYOHKkHkul9+KtIHFQho7r6Cmtj?=
 =?us-ascii?Q?h+50s9hsOyLSmQeEbuVw7L+gTtogvEd9BB4lUGck5+Q4w7nBwaCw5AU0gaSB?=
 =?us-ascii?Q?EWTHN1mDVAflZX8n5Sl527UTTG8x3MCxNIK8+XHx+dPQ/5bcRRM444YW3pdd?=
 =?us-ascii?Q?m85qxd1hQux4PhQtNIpWCaweZiIbU0Huc0hmeSyuBZAtupw9AxwMHqNacSQb?=
 =?us-ascii?Q?cvffhgBpM0xQaEK0K12eXobvOCppUnMHHLyZrDtpoUlSVgHkn8TvWML6HV6/?=
 =?us-ascii?Q?yMsEkXc/STgv/ibMyizjpUP9tr+LR9i8hqLWVUI06m7YJvcGhEPaHmJ24CEZ?=
 =?us-ascii?Q?CRBtip19g2omoeruYxSZq9Iun9Dw0Bg+tYvyc+ihStZOvUtJSnMyl+D1sh/n?=
 =?us-ascii?Q?KvFxfHdxJVdUwDJlHNDl5eFBqe2rtxeKFqm9DzqdN4S24vJGNsFYc7h4UCuI?=
 =?us-ascii?Q?vsLmN5HIpJJH2ni2iBrwg7KUcbexX3mR1m46eMx1vXHn+6oMBx6ZpP8q7Pnm?=
 =?us-ascii?Q?SJQAjCjCzIMO7UMZn87nhtqz6I4qhg4HiOZlSUud3MsT2IbK1DA2rpNwTw96?=
 =?us-ascii?Q?5HBCjO+uyeVFSzYRlXxN0XPzg9NosYF+QptaJHR9i9dCBITZRmxa9ZLHSXDr?=
 =?us-ascii?Q?gJbtSuVAHtDSuXgT9jQw7TYij1OCwOUuadgIVMYW29W4iqDJyIrx7yqV1/Xl?=
 =?us-ascii?Q?kgBPO2/pcLXq3P+DVohbSsuWkQhiNekM0Z4LnlvMf3rtXtbm03GqGlJoG1Pt?=
 =?us-ascii?Q?09dWl/q9gIzJmtPEcbpNHy76l/z/ly5iUU/XzKPicOFmeB3o+rkWyxQEix0H?=
 =?us-ascii?Q?lBhrlqG7GF6J03Vp1wzoNvqJu6T9Jq4GwACsS7QO2loHuv9KLB1ktuWT6we+?=
 =?us-ascii?Q?ePbeDsl4yN2CSvRbeUkviV+yY4c7G0cBi6POqoEMTaftCt2KV8/3wBcLdupz?=
 =?us-ascii?Q?2ZiW/jzScQQuF29lKkecS2gbwGcL6cdIe20Pa+bM9+4MJmFe/cqxjh4/pX4C?=
 =?us-ascii?Q?2vYTg1ctVG8Eode5Yjd0ofYD/RvnEYy8kpCoXzfye+Va7A0dlv7QRtXmP3gz?=
 =?us-ascii?Q?yxvTXPJkFsmGNQLYylc4kVsK9NFr4C4/zmOioD7H/iZWuwe9crPknhAbfSY6?=
 =?us-ascii?Q?LJA0i0mxg3hyfYxNLYwQcR2/ai6kWG3JflcxBelqQNnVjOedkaDjK4BvqC9L?=
 =?us-ascii?Q?4pX2EBfSUbu9xnzXB62EnEkoeczCI/qCTcl3Rkv+28QHnhEt80OWRz1m/9Y1?=
 =?us-ascii?Q?LYiK6LrgZrBbH7VFRYoQ3iR2FmnvPt4I7Rs0444B9UfuisRYM0azfCdPkRtd?=
 =?us-ascii?Q?ayvkYauQuCS+tZEU6WE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b2d684-8c15-4589-7c7d-08db507f1f67
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 11:18:32.0714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rh0955e9shalvFeNsvvql+A74dpXb7K1NI6Ls5fHFvjJQQ3Y4I11m86aAUQfF64Rj5zfyfJ2lxSVjQdLB2fzd+nzkc/UsemoUuv8T/B+7pM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9380
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

> Subject: RE: [PATCH v3] dt-bindings: rtc: isl1208: Convert to json-schema
>=20
> Hi Krzysztof Kozlowski,
>=20
> Thanks for the feedback.
>=20
> > Subject: Re: [PATCH v3] dt-bindings: rtc: isl1208: Convert to
> > json-schema
> >
> > On 05/05/2023 11:17, Biju Das wrote:
> > > Convert the isl1208 RTC device tree binding documentation to json-
> schema.
> > >
> > > Update the example to match reality.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thank you for your patch. There is something to discuss/improve.
> >
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > > +
> > > +title: Intersil ISL1209/19 I2C RTC/Alarm chip with event in
> > > +
> > > +maintainers:
> > > +  - Trent Piepho <tpiepho@gmail.com>
> > > +
> > > +description: |
> >
> > Do not need '|' unless you need to preserve formatting.
>=20
> OK, will remove it.

I get an error after removing '|'.=20

./Documentation/devicetree/bindings/rtc/isil,isl1208.yaml:13:42: [error] mi=
ssing starting space in comment (comments)
./Documentation/devicetree/bindings/rtc/isil,isl1208.yaml:14:3: [error] syn=
tax error: expected <block end>, but found '<scalar>' (syntax)

Which is fixed by replacing the text,

#EVDET->EVDET.

So I will be updating this as well in the next version.

Cheers,
Biju

>=20
> >
> > > +  ISL12X9 have additional pins EVIN and #EVDET for tamper
> > > + detection, while the
> > > +  ISL1208 and ISL1218 do not.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> >
> > It's not oneOf, but only enum.
>=20
> OK. Will fix this in next version.
>=20
> Cheers,
> Biju
>=20
> >
> > > +      - enum:
> > > +          - isil,isl1208
> > > +          - isil,isl1209
> > > +          - isil,isl1218
> > > +          - isil,isl1219
> > > +
> >
> > With above fixed:
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > Best regards,
> > Krzysztof

