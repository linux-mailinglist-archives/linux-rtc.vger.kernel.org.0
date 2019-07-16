Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15F736B070
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2019 22:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728781AbfGPUbG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Jul 2019 16:31:06 -0400
Received: from mail-eopbgr20048.outbound.protection.outlook.com ([40.107.2.48]:53845
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728535AbfGPUbG (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 16 Jul 2019 16:31:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2Yejd4V2FP+mAAm+/6scxg5PuqHS3ltYYo9tHKqujFkvGe1rJRmh4FPRnMROnkUucCDBu35bE5nESO8fyuX63aWUECAL2AUhUp2KuFn/6gWAma6xpN+hnx9wBf4aXUXpwKmt53dlFb5bktEpXyyR+e3TNKxUulkIarOU+28acrbTtAKUHoBb9nfjMa0ohIkQvRe5lw93hfGlHkWdISVajwtUU2Rq6b0ET4DDVrUdZtggteE42FpEwGz73+SY42GA6dqnAQZ99P4rCvSyI8ono3d4Q2bbs+OoV6dDneo09VvRWkW9NZdx5gfa6RXrSy9/WcbS9JCROh4nbLLqv7JfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJa/5AgrWM3v0gvkTN15W6RNVA6A+KvOz+bap9Z7xAk=;
 b=bWkrDQYbeFaPmYx5ZkBa3OVr4MSj9a3XJmnH5TvDJkzuaYVy8ygzCcjWWbz41CAmrYRgxieXN8/kyMBev1MYqdmvayHX8XXWxsMWOK2pNSTnq2vVe6nU26lecR9KZvUQkhZn+Y7tsMUFiMrlbUDAsYJAsXh7pC71EVKW0o/lViY66eQKnWAPZV8XfCRS2FQFGnszETO29xgdLhXE4xkepxOp5j7Zfbbnt2ovVwLlHp7u+dwKxeo/ZGslG+gGL84dAAfn/dIBPsAx+2jUQgKqXnyxJPjaXywwrDj6WregLLqO2Ii+H04ydmcLtRI1TGGCWNUfhVMniEX0YDAnrlq7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJa/5AgrWM3v0gvkTN15W6RNVA6A+KvOz+bap9Z7xAk=;
 b=AhANZlzat+HvT4cH/ZdkfGadGYVRRBSYAD/7IBr1jwVREYToQLfs3JBNkhiaMUvs57QbVtbpM4fEHUHqI5Nj2/MlusuVWBbGaT+AV182H4x43WF3FJXy+rU60kUQSM2FATSuAVKQh0F3lu2c4Pc2hCa5zDmrGQXxNdPMC5rJO1k=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (20.179.235.152) by
 VE1PR04MB6352.eurprd04.prod.outlook.com (10.255.118.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 20:31:01 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::358c:d36c:4f8:db79]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::358c:d36c:4f8:db79%4]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 20:31:01 +0000
From:   Leo Li <leoyang.li@nxp.com>
To:     Biwen Li <biwen.li@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        Jiafei Pan <jiafei.pan@nxp.com>, Ran Wang <ran.wang_1@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Biwen Li <biwen.li@nxp.com>
Subject: RE: [v5,2/2] Documentation: dt: binding: rtc: add binding for ftm
 alarm driver
Thread-Topic: [v5,2/2] Documentation: dt: binding: rtc: add binding for ftm
 alarm driver
Thread-Index: AQHVO8DqfFmzy9Szzkm2ppeHuiuc3qbNsvhg
Date:   Tue, 16 Jul 2019 20:31:01 +0000
Message-ID: <VE1PR04MB668718A642D1E521BF5F3F198FCE0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20190716101655.47418-1-biwen.li@nxp.com>
 <20190716101655.47418-2-biwen.li@nxp.com>
In-Reply-To: <20190716101655.47418-2-biwen.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebebe433-8cd4-4032-55da-08d70a2c84b8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR04MB6352;
x-ms-traffictypediagnostic: VE1PR04MB6352:
x-microsoft-antispam-prvs: <VE1PR04MB635270F7F1E82EC964C167868FCE0@VE1PR04MB6352.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(189003)(199004)(13464003)(86362001)(71200400001)(66066001)(71190400001)(53546011)(6506007)(6246003)(6436002)(66946007)(7696005)(64756008)(102836004)(52536014)(478600001)(486006)(2201001)(66476007)(66446008)(25786009)(53936002)(5660300002)(229853002)(76116006)(9686003)(55016002)(54906003)(305945005)(316002)(110136005)(476003)(446003)(8936002)(81156014)(81166006)(8676002)(11346002)(186003)(74316002)(256004)(26005)(3846002)(99286004)(6116002)(2501003)(2906002)(76176011)(66556008)(33656002)(14454004)(68736007)(4326008)(7736002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6352;H:VE1PR04MB6687.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ymBBRVVzhgWizqSkFZNlu+OZPMfBCh24Hg0twjtv7EL9dPfV+K9M+8QF5vPbg0W4Xih56iKiFUDl6vNAPHh2wO8Ah916JKKiLgNMyJ/027/oeceX+WbAHLpOIVePWMXqEg+kxx3/wxtS6kPYUjRvsyHiGjM18/Of1aDvh5+fwXRikU8b5svvECODIwaB4Y8Pnxxl4nTr7lbtfnYsQJPDE2WHaDgEYyBxkF7tUkP/k/UXQYuPmi7FkW+eHkERcg//mhYX5jDs79W7LZvkDQtb3nlR+R9QEfLAQOjAukSeoqtxLRiq4FvgXotQ3zPsu9ZfooZQqCKSJPnKxPfCoDfkWTCrSyoH7O8m9J9FB8nsSO5ItcD0721RrmKB8eiwN/BZU31usZxDJNmCoBCCG/EZK03aktsCAldGopr94SCrTVE=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebebe433-8cd4-4032-55da-08d70a2c84b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 20:31:01.6707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leoyang.li@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6352
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



> -----Original Message-----
> From: Biwen Li <biwen.li@nxp.com>
> Sent: Tuesday, July 16, 2019 5:17 AM
> To: a.zummo@towertech.it; alexandre.belloni@bootlin.com; Leo Li
> <leoyang.li@nxp.com>; robh+dt@kernel.org
> Cc: linux-rtc@vger.kernel.org; linux-kernel@vger.kernel.org; Xiaobo Xie
> <xiaobo.xie@nxp.com>; Jiafei Pan <jiafei.pan@nxp.com>; Ran Wang
> <ran.wang_1@nxp.com>; mark.rutland@arm.com;
> devicetree@vger.kernel.org; Biwen Li <biwen.li@nxp.com>
> Subject: [v5,2/2] Documentation: dt: binding: rtc: add binding for ftm al=
arm
> driver
>=20
> The patch adds binding for ftm alarm driver
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v5:
>     - None
>=20
> Change in v4:
>     - add note about dts and kernel options
>     - add aliases in example
>=20
> Change in v3:
> 	- remove reg-names property
> 	- correct cells number
>=20
> Change in v2:
> 	- replace ls1043a with ls1088a as example
> 	- add rcpm node and fsl,rcpm-wakeup property
>=20
>=20
>  .../bindings/rtc/rtc-fsl-ftm-alarm.txt        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-
> alarm.txt
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> new file mode 100644
> index 000000000000..fb018065406c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> @@ -0,0 +1,49 @@
> +Freescale FlexTimer Module (FTM) Alarm
> +
> +Note:
> +- The driver depends on RCPM driver
> +  to wake up system in sleep.
> +- Need stop using RTC_HCTOSYS or use the DT aliases
> +  to ensure the driver is not used as the primary RTC.
> +  (Select DT aliases defaultly)
> +
> +Required properties:
> +- compatible : Should be "fsl,<chip>-ftm-alarm", the
> +	       supported chips include
> +	       "fsl,ls1012a-ftm-alarm"
> +	       "fsl,ls1021a-ftm-alarm"
> +	       "fsl,ls1028a-ftm-alarm"
> +	       "fsl,ls1043a-ftm-alarm"
> +	       "fsl,ls1046a-ftm-alarm"
> +	       "fsl,ls1088a-ftm-alarm"
> +	       "fsl,ls208xa-ftm-alarm"
> +- reg : Specifies base physical address and size of the register sets fo=
r the
> +  FlexTimer Module and base physical address of IP Powerdown Exception
> Control
> +  Register.

You removed the IP Powerdown exception register in the examples, but not he=
re.

> +- interrupts : Should be the FlexTimer Module interrupt.
> +- fsl,rcpm-wakeup property and rcpm node : Please refer
> +	Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +
> +Optional properties:
> +- big-endian: If the host controller is big-endian mode, specify this pr=
operty.
> +  The default endian mode is little-endian.
> +
> +Example:
> +aliases {
> +	...
> +	rtc1 =3D ftm_alarm0; /* Use flextimer alarm driver as /dev/rtc1 */
> +	...
> +};
> +
> +rcpm: rcpm@1e34040 {
> +	compatible =3D "fsl,ls1088a-rcpm", "fsl,qoriq-rcpm-2.1+";
> +	reg =3D <0x0 0x1e34040 0x0 0x18>;
> +	fsl,#rcpm-wakeup-cells =3D <6>;
> +};
> +
> +ftm_alarm0: timer@2800000 {
> +	compatible =3D "fsl,ls1088a-ftm-alarm";
> +	reg =3D <0x0 0x2800000 0x0 0x10000>;
> +	fsl,rcpm-wakeup =3D <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
> +	interrupts =3D <0 44 4>;
> +};
> --
> 2.17.1

