Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E003F19A990
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Apr 2020 12:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731343AbgDAK2G (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 1 Apr 2020 06:28:06 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.3]:56439 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726785AbgDAK2F (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 1 Apr 2020 06:28:05 -0400
Received: from [100.112.192.74] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 2F/02-36773-3BC648E5; Wed, 01 Apr 2020 10:28:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRWlGSWpSXmKPExsWSoc9lrbsppyX
  OYN0yI4slF6+yW7S/W8ZucXnXHDaLY6uvsDmweMxbU+0xfd5PJo/Pm+QCmKNYM/OS8isSWDP2
  TJQs+MlZsbt5HnsD4xaOLkYuDkaBpcwS72fOYeli5ARyjrFIXDvlAZHYzCjxu/cnG4jDInCCW
  eJZQzsriCMkMIlJ4v7EZWwgLUICdxglflziBbHZBCwkJp94ANYhIjCFUWLqlG4wh1lgA6PEos
  0fGLsYOTiEBTwkzk43AWkQEfCUOPpzMiOEbSSxq+EBmM0ioCKx/c0GVpByXoFYia2X9CF2OUt
  M7jjFDGJzCrhIzP9whBHibFmJL42rweLMAuISt57MZwKxJQQEJJbsOc8MYYtKvHz8jxWiPlXi
  ZNMNRoi4jsTZ60+gbEWJb/9/Q9myEpfmd0PZvhL/d3RAzdGWeHRiGwuEbSGxpLuVBeRMCaCT/
  x2qhAjnSVx/MIEdwlaTmLF1JdQ5MhJzN/5iB4WIhMBkFomWbR/ZJzAazEJyNoStI7Fg9yc2CF
  tbYtnC18wgNq+AoMTJmU9YFjCyrGK0SCrKTM8oyU3MzNE1NDDQNTQ00jW0NNE1tDDUS6zSTdR
  LLdUtTy0u0QVyy4v1iitzk3NS9PJSSzYxAhNRSsGhrTsYt8x/r3eIUZKDSUmUd0VoS5wQX1J+
  SmVGYnFGfFFpTmrxIUYZDg4lCV6BbKCcYFFqempFWmYOMCnCpCU4eJREeG+nA6V5iwsSc4sz0
  yFSpxh1OSa8nLuIWYglLz8vVUqctw9khgBIUUZpHtwIWIK+xCgrJczLyMDAIMRTkFqUm1mCKv
  +KUZyDUUmYdyvIFJ7MvBK4Ta+AjmACOuJqRTPIESWJCCmpBqYp09oyDmeVnswsaj46ffNXzlm
  qOku3aBjtcptUW+08M2urWvLUTtZ7t1T5/T4+0Bc65Ldq+9MvIdbTmnew/u/yOX7WYZbJqtTv
  vYLPtrfnzz9gtJpjUqtlysLOSqv98nvCb29UFbZuXs7k886+Y+EvrponNjE+8g1/PvBYcDaeK
  77mtNR8ee+Z7x3vYhf9nS5YyHlxScaCq9qGnj3e99Tf53m3Kiuc+uHwcf7PrQ9zp3Sb3v7d9y
  wmeH9Wf/8WmZf1ey8vipj48MDiGAONnhfhfF0/Tj0VN7ae9zTnifa27+HvPpyYw9i0Yds6++j
  XLAdeM1V3TZsxU/DuWpH+o/ZfNjG1R2p1GgVYfng691qcEktxRqKhFnNRcSIA9T0jL0sEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-18.tower-268.messagelabs.com!1585736882!2623784!1
X-Originating-IP: [104.47.10.59]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25739 invoked from network); 1 Apr 2020 10:28:02 -0000
Received: from mail-db5eur03lp2059.outbound.protection.outlook.com (HELO EUR03-DB5-obe.outbound.protection.outlook.com) (104.47.10.59)
  by server-18.tower-268.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2020 10:28:02 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5APfWlx5dnVYdBSfUZUEhFUaSnOx1HaR0jbkcMVtLSTqQlYXVzeRPgEmzyqoE5t8eOd8NHokuVwZ8St3YAOBtnvlUZFVO/QIMYAhe7tYZsq0YrVQCTqYuzBCD/ghIZIwgQZ2gAYQTgSKWFLtZFgu+8pC6fEu0Eto5UywtaM0ZuYX4Nbh6WQvl2f8uVqr98KmFv6jywzElQS2HYWN3tvUR10wlA2tyQdynwmk74f8HufbqEcj9rWsB7i0F/eSMm9IocmuJ8zDfXCbV+Ojyci2odYZDVrTsvzzjHpxIAOQTHkJhJjwetHGiwGdi8iEL0OlygxEIbO305WlpMiom6nDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2VOi1KtVWS1ZI0+9gnKQxqv8KNSegjXBG4IAHqqw3o=;
 b=fca70/FImz4qwLJ5KY5wlAhvoLq21WY7FAnxQJNL/XQBOs8yM2/s0twXvluGO1BpI5ogpI30bXFrRmmeDcpwo/JZqAg5ngQkGaV/Hp4yJUbL3NfX+10RBbWewIx8lawRvk70qsCgcel9/pPPTbT2q/ccwEhUtxOAukia6ilx0vEsEfMGbTqdhVb1efpR87vzZFkrC6RLpKa0pdRWIg9vL813aE9ILi32XXOnwM5e52yab0NMZbEH019fFQnW6zaqObRtf2Udf6nMnpAA5hP6lCoTYv6u1KFgkWMiy9CJtpUH2Dj6HWZWiJeIIoE83dtCxX8iJyLp+s0n6tz45eDByg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2VOi1KtVWS1ZI0+9gnKQxqv8KNSegjXBG4IAHqqw3o=;
 b=yGsbJFoalD1Zwvf/P4eME7P7rwpGQX72agGmjhEI0dOUONvUNRcH85U4VKwDGAPp+AznvKxLJHj9NtAmgAKDjWTrqsgjdRuitbIM0IasZZ3YWJAh882AiL4dnNAVzEZfS58SCTyUfRGkNF+15CMTD13SlUpRwF9ji2DsZQXJ6U0=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6SPR01MB0033.EURPRD10.PROD.OUTLOOK.COM (20.177.117.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.15; Wed, 1 Apr 2020 10:28:01 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 10:28:01 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>
CC:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] rtc: da9052: convert to devm_rtc_allocate_device
Thread-Topic: [PATCH v2] rtc: da9052: convert to devm_rtc_allocate_device
Thread-Index: AQHWBhtjumggYIuUwUuUHr+0dLyuN6hkFBKA
Date:   Wed, 1 Apr 2020 10:28:01 +0000
Message-ID: <AM6PR10MB226324E39171E3A970538C2480C90@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200329224240.776568-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20200329224240.776568-1-alexandre.belloni@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fb93f4d-7131-40c1-c850-08d7d6275b19
x-ms-traffictypediagnostic: AM6SPR01MB0033:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6SPR01MB0033319310776C31952B9FA8A7C90@AM6SPR01MB0033.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(66476007)(52536014)(316002)(81166006)(81156014)(55016002)(8676002)(9686003)(8936002)(64756008)(86362001)(71200400001)(66946007)(76116006)(66556008)(66446008)(2906002)(54906003)(53546011)(26005)(5660300002)(186003)(110136005)(55236004)(478600001)(7696005)(33656002)(4326008)(6506007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Eul+RDO6vsdwtDpL/fOly/pHJ/q1ODL2PLvgjmp2FVFC1T0z+qP5n/Q6F0OuJv5UyD0eF32RM9pxsGaGoag83A9yiCvdpWwCx9yJYbNsWhfmEdbrRzZFFKAvIcoEA09NF0fvxulmlv9VjTvZLRuZ/Efh74sx3VQWFKuMF613dnEdiKLaxQzv76HDoLNQmGeSHqBt8OmlV+Ot3VJVlgOb/QlAs0pgtgKdyY4vdHlh2r99cUjv5MUcgeU5xJmdGPVTrH56UXQ6OZ2bdMfMb2AsH/66ZTjLrAcV6u74v/b42EPou2jn4OgVIe31lOGdRnrgqjuMNQwVfUP6g6kzSgmhpMnv5HVQBawl8ynqO6dJnovY0dHWNOQsABJ+e4stj7Dc6Epu5g4S1qL8CrAKmiSo854yK/lf4tjrqPY82Qj66b8wXlleH7z6JA9MZ2oy47XR
x-ms-exchange-antispam-messagedata: QAorSfrgGpz8v1DB2HbSagvl2cD/xPhd/SHZ3DFH93ugNve3+MxpNWos6AuaLIhZXvXZ401bOxuKvDUH1U+672FPnMettlXLf4MtCkgzynagsBumAOUlAxbj5BTrZ6TAO7+9N4QrNszYgclAhiiNwA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb93f4d-7131-40c1-c850-08d7d6275b19
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 10:28:01.6399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b60MEeESvcoLkWm3iak5JSh+h5bysxElYEwTiQf/dgMVzvsXMzrVcZuTCfObifHHg0I293mIvIPawN2UHpfjJvetxUSoKrdUriCC/Uxz9Pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6SPR01MB0033
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 29 March 2020 23:43, Alexandre Belloni wrote:

> This allows further improvement of the driver.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>=20
> Changes in v2:
>  - avoid reordering rtc registration and irq request.
>=20
>  drivers/rtc/rtc-da9052.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-da9052.c b/drivers/rtc/rtc-da9052.c
> index 204eb7cf1aa4..e76561b8ad4c 100644
> --- a/drivers/rtc/rtc-da9052.c
> +++ b/drivers/rtc/rtc-da9052.c
> @@ -298,12 +298,16 @@ static int da9052_rtc_probe(struct platform_device
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
> +	ret =3D rtc_register_device(rtc->rtc);
> +	if (ret)
> +		return ret;
> +
>  	ret =3D da9052_request_irq(rtc->da9052, DA9052_IRQ_ALARM, "ALM",
>  				da9052_rtc_irq, rtc);
>  	if (ret !=3D 0) {
> --
> 2.25.1

