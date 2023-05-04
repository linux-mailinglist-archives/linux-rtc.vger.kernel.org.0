Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD7FF6F679D
	for <lists+linux-rtc@lfdr.de>; Thu,  4 May 2023 10:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjEDIhg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 4 May 2023 04:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjEDIhf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 4 May 2023 04:37:35 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2097.outbound.protection.outlook.com [40.107.7.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF879B
        for <linux-rtc@vger.kernel.org>; Thu,  4 May 2023 01:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKu7KjP8M/3lJquV3HjK1uUKub+sYaau5KRNHyE77CwyKPevcrZ437wy/IEixWYqun+Fc+2wNy8d78hyso+k0MHX7/0kCAsP93GUbwVqGOTGSPO3h1/tnHXRaSalyCnC4Xw5ysObHA4XFxey941GYksUU+e208rCqB0feqE5PoF8v0WRvjB8Lk8Es1HhPghrlayD5xWx4QVGJtu3FZ5Fl9qeDFK+fQHHvHQRQsLupTnHYP08q/lRX+Ky6G66e3ACYVOb8WOrU/q/jhgpIu10+NFqzaTNJrLy+xaNb4kwJefc4+Fj0YGWRW3/HvR4fNtGf7bniL0hiR+V3na0bee5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XedKDoBHFyFGdwaR5+Vcmn2fr12gNIJ8KoQzS947Jdw=;
 b=fK481qcmTBvGIkjaV/knGmtQYVd+JZ5K7bpPm55tQY7WLHGQeW+XHPO1RgZ+TRibRB2n225kdNmXlfYL+9s4D/vfLy8pcs/vck9yc9KMWiw3mat6Am3eQ9h+2ArOYgGJiVN5Y5Wc1hCB/Xvx5n+Sm1qSG8bzw3tuA24p0jSi8jExV4NXjqL2wO/IojszFYfsxH5dMDNfNkTcdSBdY0njDXajtOkHqq96X2tpwEHSQNimCQvtzCSzZXOZa7Y6KBSXFKLhCVdpa0rauHPUoBmE831NKPHMcafukTWS7Qs1v7QZk9zq84kkNj4tvAyiqyF5gytZ9m5wIZq4OYLPSYURCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sigmatek.at; dmarc=pass action=none header.from=sigmatek.at;
 dkim=pass header.d=sigmatek.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigmatek.at;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XedKDoBHFyFGdwaR5+Vcmn2fr12gNIJ8KoQzS947Jdw=;
 b=MYWrMiojbcxpbA9d8lkobvohVl6OzZOZIlMM17vsaZdDK75C1/xegRI0hhtGVm8yUGFzTMUz7MwquQHCWcV5Q49v/wKmtl809bhr8KMR1tj7Y1mXwrLm7HFdvUHvDDca+gQFGFlxnAEqbk3oyq8Ut+x3Tf+x5FveqhlO7VhwqIQ=
Received: from VE1PR08MB4909.eurprd08.prod.outlook.com (2603:10a6:802:a8::22)
 by AS2PR08MB9944.eurprd08.prod.outlook.com (2603:10a6:20b:547::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 08:37:31 +0000
Received: from VE1PR08MB4909.eurprd08.prod.outlook.com
 ([fe80::89fb:34bc:72e9:6c15]) by VE1PR08MB4909.eurprd08.prod.outlook.com
 ([fe80::89fb:34bc:72e9:6c15%5]) with mapi id 15.20.6363.021; Thu, 4 May 2023
 08:37:31 +0000
From:   Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
To:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
CC:     Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
Subject: RE: [PATCH] rtc: rv3028: make rv3028 probeable from userspace
Thread-Topic: [PATCH] rtc: rv3028: make rv3028 probeable from userspace
Thread-Index: AQHZYIn2YxiwybJtvk6yZcq0/ZpOi69KBegw
Date:   Thu, 4 May 2023 08:37:31 +0000
Message-ID: <VE1PR08MB49094CFD69C996EC39358006926D9@VE1PR08MB4909.eurprd08.prod.outlook.com>
References: <20230327085550.1721861-1-johannes.kirchmair@sigmatek.at>
In-Reply-To: <20230327085550.1721861-1-johannes.kirchmair@sigmatek.at>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sigmatek.at;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR08MB4909:EE_|AS2PR08MB9944:EE_
x-ms-office365-filtering-correlation-id: 198a273e-555d-4743-be8a-08db4c7acd36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mSy24f0ENASfRew5wulMjrd1zEWkImpV+RezwVTY8PTraxGcl2x7QMEaQoy9Amv0xess1+ucUPEwM77hbif6z0GBXb3UjT8M9XVvM9FLeQ8+9coWUF6v3SxWNzPs2WKz2gyaa7lKhw2v3UzR/qy5w6QJLE/33zpyvyJIVuzhtjbVjh2cvm+PtoeuTtxsDFi36Ae4K3hw7rXAJR+a1f4URWjP50Ag0ac4GV8h7SHjL+pg2Uqdlagleyru7HcF/XCYe/9Q2sczW24oMF10p2IToBV2kiivxrHkV3TRTjdpF3u0dG1/bSczW5dqzibpnXK++oLR18GQSEFegznNBxRt72R25rPIz2PPiAAIEVeGaGTLWQEm5X/EGFHRFbYy4cco3yJ+YYD28A1LzKiaLCLmFmKTqVv2MuF4E3xkWUL0OdkKLjF57bw6HFEf7F0VinmagdBR/Ts1SMlqcTh7jKbTloD4Wm5ruZq7dUGSIzPj3oY4Tn2CIKXuUvvepVQUBY7tK5v1SNxlJue8TByn3YliW4/FfEE9b9PjZZaqyjBxpwVU/MhcVbnSsWnr6GSIz5XZ0mqgC9g7ue0eFJ4vftMEv0UQvnKR2DNoDnCl6voKqUJXpff8vwe9T32pBrVVl/m9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4909.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(39850400004)(396003)(451199021)(7696005)(478600001)(66446008)(66476007)(6916009)(4326008)(66946007)(66556008)(76116006)(64756008)(71200400001)(316002)(86362001)(33656002)(83380400001)(66574015)(53546011)(107886003)(6506007)(9686003)(26005)(8936002)(8676002)(5660300002)(52536014)(44832011)(41300700001)(55016003)(2906002)(122000001)(38070700005)(38100700002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Cjfu1wTnfkCKDfEpvgPc05uQgXRMZyQ4uQ25dlNU9xmngdBzW7jPw2x7dp?=
 =?iso-8859-1?Q?i5un+9r0K7/uqYKUpGQJZWPeLmCDyIYC8XaWke458Nqbcs3iLkSW805yPo?=
 =?iso-8859-1?Q?G7b3c2A9Cy7htmZcQos6WeFpSHKToq8l+jToV0VdlWt7fr2qqWew1vmTNx?=
 =?iso-8859-1?Q?K0laKaWmw3iFhC3bNm9/BmNwlYiP8MkAYJ05aD0dbzO7nN5zcGirTcr5oX?=
 =?iso-8859-1?Q?OvKW+TmHRxByf1/582GCDis2JHRWRwhxWjGpx5XcjUJZ7B0SI1/mnMFPUX?=
 =?iso-8859-1?Q?DgZZy7ZtVDrnTHbGvi91B9prmPUFzxHRp4ZTbXYWjX/U8iiOb3FYsmrGJ8?=
 =?iso-8859-1?Q?1yRzmYi2p2hFM/P/T10mUF1UD4h2VKBQPxUtdL2+/EDzV/8pzL9zS29CwB?=
 =?iso-8859-1?Q?gc/FmcaiKIHtZMo59OBs7pqYOOt5lvYTTat4GyWuwMRKTVekS7/nLE3HEn?=
 =?iso-8859-1?Q?GYP8cfrtLq6Eopeup/FHWZSs+z2wwKUGs6wUr/fSgrZEtsJ6GA/v2Rnbs5?=
 =?iso-8859-1?Q?wFGW0uw2PkaRj+zpaY4LfZ65xQCLf6W3Yj9+bkmDz4ZTZHKWfV6x2Y/KHI?=
 =?iso-8859-1?Q?ugnJkQ0yKmecHr/1Ae7ckUQ8RbMDi3U+Zm9ECYuSKBkl/9IPuH4YsLQUgQ?=
 =?iso-8859-1?Q?jpJarB61TnMbMqeFj/0/7N97uUiYUMqzePJPYKd1rQO878MApslIBchddM?=
 =?iso-8859-1?Q?j9j1Kfhn3JyOYgoYY0+MmHPUCMCSi/ExZr3rAMgSQITtIHXgTMC8Fs1PjG?=
 =?iso-8859-1?Q?SKCBSCeC3R4xb9piz+LoVx96ngSDDRiMznH++bHqnNIovf7y8UThNSHXwp?=
 =?iso-8859-1?Q?Ii0zUCHjf2g7djPzSbK8PHtFQ7k4BBEV+cSe1NALeobHzWKcnGXq3z0dbe?=
 =?iso-8859-1?Q?SK5+cfEdd7cnYLZ4gVN9cC9u8a5phPrJFu3qMjK5iHFiaFz4iL3dPhlkKP?=
 =?iso-8859-1?Q?lZyQb7RGbcxRdS/BiVxesNyLS2YtkYMtM+xy4MNo85WB+yVmtkFKh8r+HB?=
 =?iso-8859-1?Q?+8p8t1KuhZK//qJEfVI/04ghdozZ6FfkvZYR5BrYiXxjcCRQ01HJa4v4ds?=
 =?iso-8859-1?Q?SvNUFm8ykmrwMi+EmBa2wKYprHsVdbfnR9O0S5uLZ8kFy7iHIQ6ettjOxr?=
 =?iso-8859-1?Q?atCf0bNIRwdFaraMdnbK77zXWsg32XnUw9ttGrN26KJY4WNqhFRtelvkPQ?=
 =?iso-8859-1?Q?h/I8Tp3BBrGaE9r8pWerpeuDrhFG1hC6QdJphvE97KkJpcQ93dapOPp3Fa?=
 =?iso-8859-1?Q?4gLR6uTHgZneRcZBkOtSCSSN0zITGnar/obJGJqQZocAJ7HlS2Nvq0boWC?=
 =?iso-8859-1?Q?R2y+Oc9+YvetbJPFBPyJclRQksX6X/Bw5UPEgU3bahChpE5j7H4lQYpNsX?=
 =?iso-8859-1?Q?ISJIzx1p/rl6p8hD2aEputyP7Q36QIbiNhabiUQvzYE5PIqv26bIc7vldy?=
 =?iso-8859-1?Q?BQAj8a4OH8YURvQIyPVI5Ik+dtGehAG31YSfHZsRBD3XRqHANirFkvYGQI?=
 =?iso-8859-1?Q?85NXWdqnEvCszc1HJJ2JoGqMbgZpaen5h5vSFVgD4DT/yXKguWFzP9h3Zn?=
 =?iso-8859-1?Q?Eit0riO4E6taFrJdYR1+xT2PTkWBN0vXxTAisu1fJLj4uWb1xQx1zoNYIh?=
 =?iso-8859-1?Q?JDcH+HdNL8OGslELn59FV+jiq2Pxqoum9mXDI72wg/EtAcUezzijUHFw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sigmatek.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4909.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198a273e-555d-4743-be8a-08db4c7acd36
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 08:37:31.5587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcb1d87a-d2bc-486e-a62b-9ac9c746bc1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LThBK4YvM1DS2nX4CDmsgBZWHww4rE1PNbzjb90q27sNOMYopAQks+e6pao5O3J3ADwFFW7OFmgB3iwa22Ti2tSi78tR2IYj+w2tjGqUFWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9944
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Just a kind ping.

Best regards=20
Johannes

> -----Original Message-----
> From: Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
> Sent: Montag, 27. M=E4rz 2023 10:56
> To: linux-rtc@vger.kernel.org
> Cc: Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
> Subject: [PATCH] rtc: rv3028: make rv3028 probeable from userspace
>=20
> With this commit, it will be possible to bind a rv3028 device from
> userspace
>=20
> This is done by:
> echo rtc-rv3028 0x52 > /sys/bus/i2c/devices/i2c-XX/new_device
>=20
> Signed-off-by: Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
> ---
>  drivers/rtc/rtc-rv3028.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
> index ec5d7a614e2d..35fb27c11979 100644
> --- a/drivers/rtc/rtc-rv3028.c
> +++ b/drivers/rtc/rtc-rv3028.c
> @@ -994,12 +994,19 @@ static const __maybe_unused struct of_device_id
> rv3028_of_match[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, rv3028_of_match);
>=20
> +static const struct i2c_device_id rv3028_id_table[] =3D {
> +	{ .name =3D "rtc-rv3028", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, rv3028_id_table);
> +
>  static struct i2c_driver rv3028_driver =3D {
>  	.driver =3D {
>  		.name =3D "rtc-rv3028",
>  		.acpi_match_table =3D rv3028_i2c_acpi_match,
>  		.of_match_table =3D of_match_ptr(rv3028_of_match),
>  	},
> +	.id_table	=3D rv3028_id_table,
>  	.probe_new	=3D rv3028_probe,
>  };
>  module_i2c_driver(rv3028_driver);
> --
> 2.25.1

