Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B65A183700
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2020 18:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgCLRLh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 Mar 2020 13:11:37 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.69]:46290 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726362AbgCLRLh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 Mar 2020 13:11:37 -0400
Received: from [100.112.196.233] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 17/7D-06294-64D6A6E5; Thu, 12 Mar 2020 17:11:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDJsWRWlGSWpSXmKPExsWSoc9nquuWmxV
  ncK2N02LJxavsFu3vlrFbXN41h83i2OorbA4sHvPWVHtMn/eTyePzJrkA5ijWzLyk/IoE1ozL
  N2+xFSzmqTh6dylTA+NSri5GLg5GgaXMEhcnzmGBcI6xSHye+YwdwtnMKPG79ycbiMMicIJZY
  u/7/YwgjpDARCaJtZPPsUM4dxkl1k6cCORwcrAJWEhMPvEArEVEYAqjxNQp3WwgCWaBaolv79
  rAioQFPCX2zn8KZosIeEncvviZGcI2klh47AmYzSKgKrH8zBkmEJtXIFaiZ30/WL2QgJPEgms
  QvZwCzhKzNjeA1TMKyEp8aVzNDLFLXOLWk/lgvRICAhJL9pxnhrBFJV4+/scKUZ8qcbLpBiNE
  XEfi7PUnULaSxLIbs1ghbFmJS/O7oeK+Emd37IWaoyXx/OhtNgjbQmJJdysw9DiAbBWJf4cqI
  cI5EmfuL2SBsNUk2i+sYoewZSReLf0ADmwJgV4WiakNzWwTGA1mITkbwtaRWLD7ExuErS2xbO
  Fr5lngoBCUODnzCcsCRpZVjBZJRZnpGSW5iZk5uoYGBrqGhka6hpaWuoamJnqJVbpJeqmluuW
  pxSW6hnqJ5cV6xZW5yTkpenmpJZsYgQkppeD4rB2Mx9a+1zvEKMnBpCTKO8EnK06ILyk/pTIj
  sTgjvqg0J7X4EKMMB4eSBO/SLKCcYFFqempFWmYOMDnCpCU4eJREeB9mA6V5iwsSc4sz0yFSp
  xh1OSa8nLuIWYglLz8vVUqctwekSACkKKM0D24ELFFfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM
  7BqCTM+xjkEp7MvBK4Ta+AjmACOqLnWDrIESWJCCmpBqbo1us6jzNjPD//ueJmz81bmvTgzv8
  a7a+Lw0W/zt409cQLxQ037joG2PM6PrOffYrveIajNpvrs+LQKT0Ccw335bJN0XuVur726rmu
  dfcUDNJ4rpY+Or6u+aJgg7rkjTiLVbp2n/V23r921uNw2G6JoADV3ebTA36/3rn0kJ/wTJm0o
  3nvcg9f9HhfxH3yXX/nlhfWG3KZXr+/l+bGr+jxb6fD/LolmuyyM1eun+t1b+PpXx85/hr99B
  YoON6UbvSzju9f3sPg+amJhw1PzdLwk+aayq7XYd+bMPvsgyZ3zj++8vIzV0/ntoit/ZbC2Mn
  pwVAXUHU/trKN4Y7l26nHQ7/0yZdl3S6P2BssfUyJpTgj0VCLuag4EQB1UMqlTwQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-31.tower-288.messagelabs.com!1584033093!1087089!1
X-Originating-IP: [104.47.14.53]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 875 invoked from network); 12 Mar 2020 17:11:34 -0000
Received: from mail-vi1eur04lp2053.outbound.protection.outlook.com (HELO EUR04-VI1-obe.outbound.protection.outlook.com) (104.47.14.53)
  by server-31.tower-288.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Mar 2020 17:11:34 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxlRcKEfYrsfTXJQSMJGxp4Z68EGtnCA267fYgnrflNprcjEeRjKBTDOAy2/zUELmM48VsWwnxZra+5/2r1zI//w6TV5FNLBKG+EX5oh7DvfOu+ebmuywTlxxlXO7cE1ZZgtpHcdx9sLu9pBfXGCN5Rz8VK/CL+QkhMidzhEQ5Tp37zTwbaRyIVI1pce2PvCgohb07/l3lFJvt+aD2X7ZZwzJ7R9wYIEnBYFCJkMW9UBWDQagOt3pJCFmpHzbE6M5ZjqWNU2MtZbXfCllxh/prHjS3nY3Y0mJU5dkaiWC/eSa//i6uzWclInPGgPUn+CvdMi4DTOFZxhmpZsDy2UsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psohkxG7LZ/S1xm03yfsWjzLOjmbHBJ2cjQiYLKRIEE=;
 b=PL972ZIlX1UAK/qlY1Tm4cwV4YHulLcXctEUMT9FjwPfS98gnXLY3BFIXV2z+VX4xQyUDjz9NKs84+/gM1GYWFrlYeOu1hLpRdt1o5m/Fm3d9SOGtA792O7G6SruGjcaBQM+D4wGw0quXJjo34JJhgahEeQwu55Cgh0gbe/kKxkg7ODXaOx0YhJnKcv2wbGt4CDST/A0Ac6BQqj/zYbf3SuJLQoH7SAblb+mhNxPoaJp5bkpTOLHtIomxA9F8h5WS7TeVg/iBM4Cq5hknijynXWej+ZSmlRVme5//CIBuuJd/nWYqpI9SL3gAGtwepBdNdjqMvnbVC3baqP0WVCB3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psohkxG7LZ/S1xm03yfsWjzLOjmbHBJ2cjQiYLKRIEE=;
 b=Hs4zTl8fejOY5c+b7Z5dEKp3pL29hqAoTCMgzEsD2VaeLwZ/Q/YR1eXFNzWVOctaLjwQLMwGJp1A6YptlpTTMeBMOIdRskU4blU10lVbPMoaRbj9MJR4izdE8WFk9TLphSP+lBNZwkWOFZALa325yOA6wa+le1lmcVD07Txe3WE=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB2486.EURPRD10.PROD.OUTLOOK.COM (20.177.116.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.14; Thu, 12 Mar 2020 17:11:32 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01%7]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 17:11:32 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] rtc: da9052: convert to devm_rtc_allocate_device
Thread-Topic: [PATCH 1/3] rtc: da9052: convert to devm_rtc_allocate_device
Thread-Index: AQHV84nfJ5lo00LnaEqeYTBLl6dE4ahFOjtw
Date:   Thu, 12 Mar 2020 17:11:32 +0000
Message-ID: <AM6PR10MB2263C59AD9D269C5D276245580FD0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200306073548.57579-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20200306073548.57579-1-alexandre.belloni@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.240.73.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a47d5eaa-4c93-4e8e-7c30-08d7c6a86983
x-ms-traffictypediagnostic: AM6PR10MB2486:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB24860E3B34895113B5F39B95A7FD0@AM6PR10MB2486.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(199004)(8676002)(76116006)(81166006)(81156014)(86362001)(2906002)(66446008)(54906003)(110136005)(7696005)(53546011)(6506007)(9686003)(5660300002)(55016002)(52536014)(478600001)(71200400001)(4326008)(64756008)(66946007)(66556008)(66476007)(316002)(33656002)(8936002)(186003)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2486;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JBXVJgx37zIyzIbMzjk8G+zu35uK08azBNrU9Xr8mryVEpOMw+fCKnYpNA5g82ZxIkFTZ7tRTDO3YVUWFYfJyHI5bEwY3N75J7WUsdWHDBSCCcxrqtScY0fidy7nzUWr/WSevfVhc5HHjbArA4lzq2MbhSauOqXi3zqsC5TCDpBuAgWDGqxhM+Zq+62DeOQ4k+1HdKGcpygZNDd0w+K+Eea9+goyfUCvp8u01O0txZR1T0pWrKzyhsnJL1gHLlTpgbFvwjuCkavLkUwDzTxGx4lgxLZYfDlc53hxd4I22aU6/I7W7lGr5nKi8sB3/gJm8ZLXAa4vmnSCwnlJMJsTyJ0woB9t9pLrZ16w6Z4yWcH3e6SpmnSk8tPYtro+yo5yusc/Tk4qmrNjmr6FrnoDN3HUCzh3uUryT2Ex/NKZ0kz9thhFLOqjKDlgqbZykT/1
x-ms-exchange-antispam-messagedata: jBFd6Pmb9druwDzbQOvGMO23H94kBihFJ9TZdqNJo9adlKicFooo5WH5cTK/7dMTO3azoUtBkEIMDrXjjv8Ts6Sof0ZrN1wo+bJIzB26B9DeBOse8n3uC3moR/XSjoZLpX97mACMCRutW7C3LK0Org==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a47d5eaa-4c93-4e8e-7c30-08d7c6a86983
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 17:11:32.2075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iutrspYCv41XfHq0nn+MPGjSjXg8ys2Qr5VCpVW/9Fao3DyjO2snqh2tAAn+GQHIeJKmH4bxeseVDLD87TQrYaY9WO5hljODFDrz4IbfQuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2486
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 06 March 2020 07:36, Alexandre Belloni wrote:

> This allows further improvement of the driver.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-da9052.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-da9052.c b/drivers/rtc/rtc-da9052.c
> index 204eb7cf1aa4..e159c5911122 100644
> --- a/drivers/rtc/rtc-da9052.c
> +++ b/drivers/rtc/rtc-da9052.c
> @@ -298,12 +298,12 @@ static int da9052_rtc_probe(struct platform_device
> *pdev)
>  		rtc_err(rtc, "Failed to disable TICKS: %d\n", ret);
>=20
>  	device_init_wakeup(&pdev->dev, true);
> -	rtc->rtc =3D devm_rtc_device_register(&pdev->dev, pdev->name,
> -				       &da9052_rtc_ops, THIS_MODULE);
> -
> +	rtc->rtc =3D devm_rtc_allocate_device(&pdev->dev);
>  	if (IS_ERR(rtc->rtc))
>  		return PTR_ERR(rtc->rtc);
>=20
> +	rtc->rtc->ops =3D &da9052_rtc_ops;
> +
>  	ret =3D da9052_request_irq(rtc->da9052, DA9052_IRQ_ALARM, "ALM",
>  				da9052_rtc_irq, rtc);
>  	if (ret !=3D 0) {
> @@ -311,7 +311,7 @@ static int da9052_rtc_probe(struct platform_device
> *pdev)
>  		return ret;
>  	}
>=20
> -	return 0;
> +	return rtc_register_device(rtc->rtc);

It seems with this change there's no tidy up around the IRQ.
da9052_request_irq() isn't calling a devm_* function so I'm not sure how th=
e
IRQ is being freed on failure. In actual fact it looks like there's no _rem=
ove()
function for this driver which, although that's a separate topic.

>  }
>=20
>  static struct platform_driver da9052_rtc_driver =3D {
> --
> 2.24.1

