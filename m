Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34A26183735
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2020 18:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgCLRQi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 Mar 2020 13:16:38 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.2]:54713 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726387AbgCLRQi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 Mar 2020 13:16:38 -0400
Received: from [100.113.0.63] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 5C/C8-54465-27E6A6E5; Thu, 12 Mar 2020 17:16:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSfUwTdxjH+fWu7eF6249Sw2NX3OiExJeWls6
  khsyxTCfia0yWJeDbYW9tTXvUtmCrmSuLRR0yceIMWoHOAnOdZiDZJrglsKwDMjVDcUzHBpFM
  yyYYZPi2kN1x1W3/fb4v9/yeXB6KUJ6XqSnW52XdHOPQymaRtmxFjs7Nbd9sePBLhjnyY7/cv
  G+sSW6+0h6SmWPRq7I8Mr/us935x+oeSvLvtc5dTxRK7VxxiW+r1HZiKiR13Zf5wjFPAP0tfR
  /NohBuJKDn8B2ZKGIkhAZb5KI4h+Bx1cOZhMTdBPx1qUIiCCX+UAKPT58jRDGIoHl4ghfJlAy
  b4Uj30MwnKlyD4GhNpUwICLwbpsYq5AKn4mzoaTnN+xRfMsA3wwWCrcI58GDqhlRgEmfCya+j
  cqFC403Q8bNVsJV4F5S3HZ2xk/HrcOGgWrARTofJ8ighPpQG10fqJQIDxhC5cJkQeTbEb05Lx
  T4LPe8NINFfBBd/GkmwFpoGjktFToe++sqEvwYuxfcm/AVw69dWuchmiFQGSWEdwPNgussv2g
  74fSCUqGdC4Ldooq6B0ca7pPBzAH9EQu9EOapGhuP/WVvkRdDQMSETeSE0hf8gBKZxCvTUjpA
  NiPwULSl22602r5OxO3RGg0FnNJp0Obock0nP7NIxerZUt43lvG6GT/XMTo/e43duc1j0HOtt
  RfwVWXZI4l+hL86M67vQHEqinU1Xr96+WflscYnFb2M8ti3uUgfr6UIaitICXeXgsxQ3a2V9b
  9sd/C0+iYFSaFX0q04+pj0uxumxW8WoF+mo6vjJjwklyZVwrDqNviHMwELJVso9HfHkovtQuj
  qVRklJSUqFi3U77d7/56MojULaVLpAmKKwc96nL43yS0j4JQ7GrMISXubfSB2Q9GYcnr+CuPj
  Bd1md8WtZFbfN6Ucozf47K1cuLaTqvg0O7OwPvxAMLF/3ZUdtaKC77f6m3JuTE+Nv0G7OOLh+
  4caRE2VDbaa6q8ph7eiZqu8PZNU2Bk/NgbWPfO2Rl4Y+eVNTsuHsskMvd2+scFmxvWa8LHtxZ
  mDfqgOOeubYXAdd1rKnbau5sEuz158RfMXRNF2g6vEvuza5/M/whtf6QT8vb0eR3/XMZZviiu
  X5UN67uHnLRGDtD/PvSVT55ZnNydmxcFFp/fUx2/5ky4u1LW8t0Y7cqjKZH533Nq6eKlqcoqb
  HosTtPYZDa6LPhRv63jHntueu+rxO1tl6t/Ns7VIUGdKSHhtjXEC4Pcw/GpYWLEwEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-28.tower-229.messagelabs.com!1584033394!1033248!1
X-Originating-IP: [104.47.12.50]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6184 invoked from network); 12 Mar 2020 17:16:34 -0000
Received: from mail-db3eur04lp2050.outbound.protection.outlook.com (HELO EUR04-DB3-obe.outbound.protection.outlook.com) (104.47.12.50)
  by server-28.tower-229.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Mar 2020 17:16:34 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hf0pc8XQznPS/y26Mo60ZzlTzaHSRInUzUNUsMPln/4yU64hS+yiu4Rgu3CLub3flYU+MX+TBzdpA1Qz4XKPt1vVp77/mItGUVcfGENdzK+H+bKHq43cAWCOPGwZv1jm2uJfqhSj9MJKKr1HJphQVvviPoD12i2rurTAQuML8FWQhZxHge/9ZRrNRdsRvPoNcga84o00nr3SQdQn4RKkJHNqaY5zZrjygRtLRwaKZo55L6R3JgO4V7X5VkiI9HjDUWTJQezXLSdOTxvm3IRgtYTk/Nl4FHGeQ3Wnlt7V6sn6t5OCV+i+Go/k6c0eLyyrp7J3yVj8Q6zPvfvn7gIrBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpSRDRPplo0IorpW/sSk5nMwEsvCMfiTQR6UMl3g1WE=;
 b=CD4U1ko0DmAkzKQ7kszpv1ILJPVbDnKVICWwbgYvivoITSK3uHnAXTGmfHjDlYYrn7WeupccDC68Kx2K6YS+OMniI13DaDpgLe1NJbUD9uyVZmR6KBoGMZbNRnB4hweViyR88fDsN1NzviA0HYeIXnFifqpYEMwVYXZHMOtQNMYYZ1V2yP22ty37NCyF9CiNRC3kIX3maxOt+klmHoxpug5pI3CVQ6XZdgN0BkTkPIXv0t9l0MiqvhGCwesEcjSoYSTy7A6sVPdsV7+z+lX8I4A0FP+k8YzXD0pv3zBeEOVoLMSkEuqGc3EXz9Bntn91mcC3cE4EzLyVCcpu2oF/Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpSRDRPplo0IorpW/sSk5nMwEsvCMfiTQR6UMl3g1WE=;
 b=kSfaI3EdtvRWLrkDeSirChqFle3pq7NZVF+Q1KkH5u6j15Jg57AckzUXIlfN+y4w35Fyh/6YvSzUn6OXL1cf4lG/teIJfU/SpBl1mYlUlm78NREMFxXDDEnVs1dnWUfq/P4T55rETBsj58bEARwZv9m5CTArzfidTUDLWTlsjhs=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB3079.EURPRD10.PROD.OUTLOOK.COM (10.255.120.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Thu, 12 Mar 2020 17:16:31 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01%7]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 17:16:31 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/3] rtc: da9052: set range
Thread-Topic: [PATCH 2/3] rtc: da9052: set range
Thread-Index: AQHV84ngedRHmzibKkeTdGwcOQdj0ahFPKBA
Date:   Thu, 12 Mar 2020 17:16:31 +0000
Message-ID: <AM6PR10MB22631EAF221358A54BE96A5780FD0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200306073548.57579-1-alexandre.belloni@bootlin.com>
 <20200306073548.57579-2-alexandre.belloni@bootlin.com>
In-Reply-To: <20200306073548.57579-2-alexandre.belloni@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.240.73.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47c525a3-48b3-4178-cae7-08d7c6a91bf6
x-ms-traffictypediagnostic: AM6PR10MB3079:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB307961ADB0F5AEE39C7967FBA7FD0@AM6PR10MB3079.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:534;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(199004)(8676002)(186003)(8936002)(316002)(71200400001)(4744005)(53546011)(6506007)(9686003)(26005)(33656002)(2906002)(478600001)(4326008)(5660300002)(54906003)(64756008)(76116006)(66476007)(66556008)(55016002)(7696005)(66946007)(86362001)(81156014)(81166006)(110136005)(52536014)(66446008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB3079;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q79i/cp+RnwtbPkYahwzzn5qZVHTg38QNt3TN6GdGPzkHE8wiAFyJXHOaclx77BU1M1C2+pjmRpXTzf/QANdjlFmX8bx1Be4yBDFgAHuby3FIqNckRVskjs4cFa8S5Opv8caOpEa5Ouv117zQWdUkwtefp+nQYMmUS2+kM1e/8ku6fE0IPsjtNQ/SJC1Hq0JbUTG/oPqQ1d7X6DKs/qnM5kHg4eVMYzIuT7+hhqW/0ksC5YeRWnNx0f43vhyt8oop+2LjGIHwls09njVKLS7Bmn6uUm3GsSDrTCIvg/eXIUqJvyRi+XDFLvR5PaflITcO7DURi4il0QCkATuqWeGpD6Zve4BOnRKzs9tivSTCsbB4cfzZ6WJJ9BdWWY8OkJq6Pacocsxiat2gbgQnQpgWL21LCEPQcJSCC0zOMW3nWMbmSqF1ZqgEtsvpm/sWGGj
x-ms-exchange-antispam-messagedata: iVwNTplmC8d3sTQPfPGsTc3dVUICe1u5sLnT1X/ASDMlpPQ7TRUnlDOedFN/pE9Ftu0fc/y9X+KvqBIMNUZ1ElpGfCU0yyPVBcFekL/t7s15E5zm6yQHGD8tdDAkg4Vy7zmK8Xra85AAfofNnXZ1dQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c525a3-48b3-4178-cae7-08d7c6a91bf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 17:16:31.4737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OI8gJ/LTF0sS1edLFwIQ+ELrDHjoO3a+rCZbSU2YhnaPk0f8ZlRUnbim/BbQ8Vv4l3CsufmFyO3lGzlhreFPLYRYJVHix8e+eGEZ0+/srU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB3079
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 06 March 2020 07:36, Alexandre Belloni wrote:

> The da9052 is an rtc valid from 2000 to 2063 (max year is 63).
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>  drivers/rtc/rtc-da9052.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/rtc/rtc-da9052.c b/drivers/rtc/rtc-da9052.c
> index e159c5911122..27cde834a1b8 100644
> --- a/drivers/rtc/rtc-da9052.c
> +++ b/drivers/rtc/rtc-da9052.c
> @@ -303,6 +303,8 @@ static int da9052_rtc_probe(struct platform_device
> *pdev)
>  		return PTR_ERR(rtc->rtc);
>=20
>  	rtc->rtc->ops =3D &da9052_rtc_ops;
> +	rtc->rtc->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
> +	rtc->rtc->range_max =3D RTC_TIMESTAMP_END_2063;
>=20
>  	ret =3D da9052_request_irq(rtc->da9052, DA9052_IRQ_ALARM, "ALM",
>  				da9052_rtc_irq, rtc);
> --
> 2.24.1

