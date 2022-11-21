Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEEA0631E43
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Nov 2022 11:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiKUK0k (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Nov 2022 05:26:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiKUK0j (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Nov 2022 05:26:39 -0500
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2053.outbound.protection.outlook.com [40.107.103.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5AAD218BA;
        Mon, 21 Nov 2022 02:26:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEqILJdOS76YZIOmb6HvaQsOiNwVGUMBEBfngJTLX4tTMihanNvXM84Wy3mc+yUT4NiFQ8U53cGG9yKtk+Li/T1bKlhfkR6NTTyDg0Lo7it2U/VEQCGC+kpWoLuPMqOjAfxU9WIFWr/j8vwbGRjohxYjWjYo5s78k7DnoKiqOcsivsrfW0HCM5Fad0odeDUo2oClYSJUkW0CLK74IV0HTkl4sf/N7RiOX8oeshhROV02vM7byXyTpkUkN2TyjjqgI/QgG1NISkmSSzucfR8jbsZVGY86PiNc8EU+piiKBhhmacAyqglV2M3wiNI69zBUL40nIYfHgC7PFDeV83nXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcX5Us+CDZo+sqbms3SWUMFK9Z6iAoVSHFyClzkH3S4=;
 b=g6XbKOftmIo3jjpFtG/4cmEwE+bLdcZ4mfw3Da6HmOiWdb2DEKGWOsxNGyuaD6HB7UveoL6mWNiWqymsks7L/iySDWbSqIsYGO02gAgOMWTSmzYYLLFm+bwIO+cn8MhhgxLAztz8t2mOFHHnG7uRlGDJm3VoTSUmIUYW1hMXw3p+zAxqRJQLN6EYF+QzuhQ+GYH4ZJaydqSus/gZPJXjHBngfMS7SSJAQ1S0diTjdbXsEdswWr0IFldjeJgDdbLy+F7sl2F0qVr3TagVCL33rCKue3Gfe6RoJD1Gw0qaRj4KJs0Z0RmS8Ay7bpJHF1jqMC+pgcPdiXg3QfCWYNumlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcX5Us+CDZo+sqbms3SWUMFK9Z6iAoVSHFyClzkH3S4=;
 b=QSGznAlnyqglsLY2GrN7u60Nf6rAZ8sQTAlxJMwh8P88QRznCI4hm4uExAPPcqWZBz44VnaM+91e0bTcqFtZPBk1xUiO1QCnnVo4oztFrQ7iYXtUOmnvZBSXuGRV7V4d4OmgJQ2Lclqc+UFtjv/k1bzyX2olzjvryH3/J36pU+U=
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DBBPR04MB7929.eurprd04.prod.outlook.com (2603:10a6:10:1ec::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 10:26:35 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a%8]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 10:26:35 +0000
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
Thread-Index: AQHY/XWNECi6akMI70mG4aJ99Q3psa5JFw0AgAAMooA=
Date:   Mon, 21 Nov 2022 10:26:35 +0000
Message-ID: <AS8PR04MB864223C12564CB68F5836908870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
 <2aeb0590-4fd0-5bb4-5e68-0378953a94c3@linaro.org>
In-Reply-To: <2aeb0590-4fd0-5bb4-5e68-0378953a94c3@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|DBBPR04MB7929:EE_
x-ms-office365-filtering-correlation-id: 481d5b0d-1b60-41ac-c7c1-08dacbaaddc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +QCOlgu9URAuDn6RUX8IWeFICEcd8ZWHzS6VbiN+YyQqrPc8AVZ+dWLISnepVcmHDDoYYtEaCuvh1S5Q0GCAX1anLRHr4wVhLsCW14mvthsjFjIPvKxv/6VPVqeK/hHVxQpehgp1qcxgWOJ8Sf5jUgfWBKNL1pL7Y/ckjnHIu19nFt3KHdb6M1fFS6Fz7E2+AVLalfdAhY+EBJfUmuzDkRNNsKF0KSHBUymibPsyPuz0vwzD8e0js/KPL3kA3gbpE0GZEdQb0vfWlMD6yF9Q4hAGlPR+3h+WcNwi5h7jWUfQhKTW73MUzPuxnJrv6PrlNnXz/0gA0kAe6USMo1YHOlAkSlZW7NKy+mR0a09bnYqDTg7NdVs9q6HpdkDCwHGBlgLLBWCGvfnymMzxSbkVg05bZQS/QLVhC1/trEKWvLHuwfWwwOs8KH/9d/iQLRkKRKNZNlDfeBQl5oxznto/hh2b8FVhvLNoV4I+3WyLZ0bU3zT2Pl+BGsqrE0XEiRtRIYidh2mW18ZAH/UJ1a3le/70OFlT76aFaMXVySicJXE30v+JCqFmv1kct4tsF6JVL/3vTyBw5I0Z7vQmqZ+JgIF4sfYD9f/8dDi125CIYewc7rTdQ7vAXqe1xOh6Oz80CkjDtr2zurz0Qwi8iuHe537Fm2gmDKEubn8NVvbvAyaBPwR7B9f4XOSJrClZ8XmNJik19rsZ+LzDYgSeEwEw7g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199015)(99936003)(122000001)(38100700002)(33656002)(86362001)(38070700005)(7696005)(6506007)(53546011)(316002)(186003)(5660300002)(8676002)(9686003)(26005)(66446008)(54906003)(66476007)(64756008)(4326008)(76116006)(110136005)(478600001)(66946007)(71200400001)(52536014)(66556008)(55016003)(2906002)(8936002)(7416002)(83380400001)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EWW5rpw7WpMypHS/Jw/LPe9UtnkERq6uqNnjJPAGmRfA18gSSGfa3FDATIBE?=
 =?us-ascii?Q?7u7T+88eQkCDi9bDWgEeEWwvPgoVO9qk9VnOr3tVECooZshLFZRfSc+ghT54?=
 =?us-ascii?Q?z6B+gRrLWV3w7ldoSbHpZRMX7o32g817fxlL5s5LHK8HcilQc3+wsTgdT/n5?=
 =?us-ascii?Q?1W9V5QNLlaFqmf0OiYU6k6e/WHinIm3UL8N0fHikkjRQGw20zkNaDTV5QCgq?=
 =?us-ascii?Q?hmFO4O6sX68GZ8dkzxi8xyuQtdLcXP5FahfbrTTfbPAyjPOGw4krD3PWoPTk?=
 =?us-ascii?Q?WXaYD+iYMWYhuy5wL6rop58RfWWAycq2K7rDRvqJALuey6E6VR4TGHG9LB/u?=
 =?us-ascii?Q?uIjLaRPei83bl+uvcyQimEmfAU7gjHc/k0DqiUD82f9XAY8Fa6PmFX4RiEkH?=
 =?us-ascii?Q?65HZLoj/1Fy2nHbjjyZxj/2WXgLS1P3S7iJwFAWofLPbDfQP/NqXlEuM6yvo?=
 =?us-ascii?Q?Lraluclvn2GV4Yv72jPOWu8KWHVfQIq53rcjyQMM1taRzOjA8UvRrEEeCvyn?=
 =?us-ascii?Q?fDt1Nq8Jze+c8zDjzk/3gufhsPAavTgJC9zERGszeD9JE1nx5s80udPRD6Bp?=
 =?us-ascii?Q?lPVK/S1NIwYAJ3hPqp9AR5fIux5fOzlUsco1VY/04Dgc1eJCSCOwO4j06rtW?=
 =?us-ascii?Q?kujt+FX03wYvNzOGqk9bWAI06MXjo5Xru7kDLePnkibMrAPNNwY7Evd8K8JV?=
 =?us-ascii?Q?moAOUpIHNHFQMP4n193zp5mBzM2855qGZMGaxG1pYZEAarSeDzhtNOQi+2iU?=
 =?us-ascii?Q?h/qXWR4RguWbQd8gnDpK5+vN/3eNe8dcmqZzO77H3og1taSKlAradefqQtpc?=
 =?us-ascii?Q?ukxLsIhHPGdSG+XcNEE++kJZeudrhbJSILi0JDz0OtEX3L2X5tS1s03RGPw7?=
 =?us-ascii?Q?9uxW/ZH7fGk4zZMKJYHBQqjCczbfyOR5KMtCXOtYbRUWLWYEwbyf9UigB89e?=
 =?us-ascii?Q?Fw5oLcq+42JeZ/EZSWylu507vYB1dDVeXjRaJL6cSmYqyKKMbf1p9yK8SNK7?=
 =?us-ascii?Q?JI8i4H/UiQO+tZ3ljtj7c9tKKLLepKUXKVLkf4shr4bLYzhDVm0GKnTsrgUV?=
 =?us-ascii?Q?XYgPNgFTbsWKyxrhKiISSzlG1n5NFk0HGeAobpHksX1fJIEejKlK/a4gWhdL?=
 =?us-ascii?Q?RGL3JLRxbMlrUQeopzV3t8StVe8mDNYd5HscIX+h/+ula1qo25PxMgdNXtWU?=
 =?us-ascii?Q?yPmdKgLa/hK7Hjbt//2T2lnoPv0UutxHRfT3Bmsv1Yn55BgfZSB1I1gfOeng?=
 =?us-ascii?Q?HNKKJ9n+DF4DDIs7W/Xi37yHcnP8s1HGAaaLqIONN/Ox+STNfdaYkhjA4Rtb?=
 =?us-ascii?Q?zQnSGXZtlo7/U4ZFSbeGNt0L7Zyv730Ct4cjF58sw27NS7Rv5lik2nkrUUje?=
 =?us-ascii?Q?qD9jgyod7GnKXgjaR34ywizQMO3xIwnlhLey66wTJJn/RAZSeoH5rtPIV0Oo?=
 =?us-ascii?Q?mq4gSUhq0beEZG2sMw54l6sxD37at6i73UG9yzKCOQe3m2TQSoL1iHuB7p71?=
 =?us-ascii?Q?CBrhDZJSwtpkfyYf0QeYOrVoHZySMrSbrTJVDUFqGk8/+OwjIEw4LcNifdhH?=
 =?us-ascii?Q?4SL+SnbvQYQlUi21Hvk=3D?=
Content-Type: multipart/signed;
        protocol="application/x-pkcs7-signature";
        micalg=2.16.840.1.101.3.4.2.1;
        boundary="----=_NextPart_000_0160_01D8FDD6.C82164D0"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 481d5b0d-1b60-41ac-c7c1-08dacbaaddc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 10:26:35.1533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1lggmHTEjggtzkw1axAdFmOdKDeLix8n432Wf31L4T2taS3V0kLN98E5UbenpFwwXqZlkw6nSWivvwkgNVw+Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7929
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

------=_NextPart_000_0160_01D8FDD6.C82164D0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
> bbnsm
> 
> On 21/11/2022 07:51, Jacky Bai wrote:
> > Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---

...

> > +
> > +    properties:
> > +      compatible:
> > +        const: nxp,bbnsm-rtc
> 
> 
> Missing ref to rtc.yaml.

Ok will include in v2.
> 
> > +
> > +      regmap:
> 
> Use vendor prefix, descriptive name and description. Where is the type of
> 'regmap' defined?

Type is missed. Will add a description and type define if necessary.

> 
> > +        maxItems: 1
> 
> I don't think this is correct. Rob explained the simple-mfd means children
do
> not depend on anything from the parent, but taking a regmap from its
parent
> contradicts it.

For this BBNSM module, basically, it provides two sperate & different
function: RTC and ON/OFF button control. But
no separate register offset range for each of these functions. For example,
the interrupt enable control,
Interrupt status and basic function control are mixed in the same registers'
different bit.

Any good suggestion on how to handle such case? ^_^

> 
> > +
> > +      interrupts:
> > +        maxItems: 1
> 
> You have same interrupt and same address space used by two devices.
> 
> Both arguments (depending on parent regmap, sharing interrupt) suggests
> that this is one device block, so describing it with simple-mfd is quite
> unflexible.
> 

It is depends on how SoC integrates this BBNSM module. From the BBNSM side,
it has separate IRQ lines for RTC function and ON/OFF function. Different
IRQ lines
can be used for RTC and ON/OFF button. But in current i.MX93 SoC, those
interrupts
are ORed together at SoC level. That's why same interrupt in the example.

> > +
> > +    required:
> > +      - compatible
> > +      - regmap
> > +      - interrupts
> > +
> > +    additionalProperties: false
> > +
> > +  pwrkey:
> > +    type: object
> > +    $ref: /schemas/input/input.yaml#
> > +
> > +    properties:
> > +      compatible:
> > +        const: nxp,bbnsm-pwrkey
> > +
> > +      regmap:
> > +        maxItems: 1
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +      linux,code: true
> > +
> > +    required:
> > +      - compatible
> > +      - regmap
> > +      - interrupts
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - rtc
> > +  - pwrkey
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    bbnsm: bbnsm@44440000 {
> > +      compatible = "nxp,bbnsm", "syscon", "simple-mfd";
> > +      reg = <0x44440000 0x10000>;
> > +
> > +      bbnsm_rtc: rtc {
> > +        compatible = "nxp,bbnsm-rtc";
> 
> Use 4 spaces for example indentation.
> 

Ok, will fix it.

Thx

BR

> > +        regmap = <&bbnsm>;
> > +        interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > +      };
> > +
> > +      bbnsm_pwrkey: pwrkey {
> > +         compatible = "nxp,bbnsm-pwrkey";
> > +         regmap = <&bbnsm>;
> > +         interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > +         linux,code = <KEY_POWER>;
> > +       };
> > +    };
> 
> Best regards,
> Krzysztof


------=_NextPart_000_0160_01D8FDD6.C82164D0
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
9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMjExMjExMDI2MzJaMC8GCSqGSIb3
DQEJBDEiBCDXLtw7ZURB3xT1dJQNR7uMz9oJJ0J3LdsixJ6PE1+eRzCBkwYJKoZIhvcNAQkPMYGF
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
CHtC5W6zRq9c0YAAAAAIe0IwDQYJKoZIhvcNAQEBBQAEggEABs6P3w990vmftqy7DsBLjmfLVGE4
DoYuDc+zOQ4pfsQ08qq9VlMQrAwUyf6VSDR1/8ySq8ESEt7EsVRJwXkODccJHh4k/eUlY/8ZMo/V
Z6E5bGIQ5DMD9HHH1aiWAd3Smox+bZwKrfNEHwOcd8aDDBnbMSDxvexLhv15uIjrynKZO7aXMHo/
ACX9I3kbiLIW6coE08B/7nxC4qrWMN8nOZX3lT/3MSjjVd9BmFHHFRo69devUlnCgkWhv+/yIJIw
aQkHm3A0SqH+dcKmWCuWM7a0RFTkOP3q3+Wz5rGXbywVdNQXKsCFQASaEt8mKkquwEbqo5wrIZiC
Sh3VpmJyRQAAAAAAAA==

------=_NextPart_000_0160_01D8FDD6.C82164D0--
