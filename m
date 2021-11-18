Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0313455844
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Nov 2021 10:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245273AbhKRJw5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 18 Nov 2021 04:52:57 -0500
Received: from mail-vi1eur05on2082.outbound.protection.outlook.com ([40.107.21.82]:30401
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243251AbhKRJwm (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 18 Nov 2021 04:52:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJjuVVKcwboYmvVvx4v5o/O2yvoU6aaGh24zCnQXDju3tI/LzJH0x2EKV/T1srRGZlTUnbboJe00O2OBUkoCJDfqIp2fZAzPpSohNzxuz7hxdSMlJaqxT5HdauBOJog2+AE7W2k2x0mKYF5l8pZdGDZi1EJ6bJGmbvS6aoW0adGosZ1UYNnGGbjuPU5kbauUkNjQHIg+e2haa71optj6UaKCjvrCxKsbwIpg70g15PeSon5ttl9wV7iRK8ipqDu/wliJgjy769j8lrfr2ic62Ue3N3m4gN2Yds+fZ8GsrIYzEYWCzhg9cWu+wz1WOgQo7gsX9cj3wQcFl1eBGaudbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxtQNUjJp8OQzsKEVUvBO/6AObUQTwAxawoO1iqX0qk=;
 b=J4+yICcOzGQgtwSrZREMHERSgA2NhDUWG+EC54VcrPm/2vlqnSn5C/kZRYB/zCRslBJhVEAKEuay+6/SHrFto84+v1G2qx88xPMaoIpLHtLMsGg1L+qzWPd1pLrZhjqfFsw6mQTBw3ENToJID/uUqbQJicbNmg2DfPhSGT5M0FIxPyuFLG3r1RjovNct6w+mbkTnT1falZ1D2vTyfejqHx/C0v77y/rV0A3aABkovrrIZl4NWYO9N5aFWZ2ImdW4cKpT0mPJp6XhOY8D0yqe2hRTd7iR/ID/o/L4MQxUWB/eG+RkkxlG6liTTcw0TVv2qrBdMi9ll+PiKs0yJZBUNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxtQNUjJp8OQzsKEVUvBO/6AObUQTwAxawoO1iqX0qk=;
 b=htaIV/Bnn+mzlVGFeamJzjy0LYWsH2EsY6e8TrJMsycD0XcbKIK/wXTx1vDqgh2Rrr9lnjwrTEMlaYMrmQh5/fm0ntELgcZda+gswBiSsjepX42DOwfme2H4WNJD8LszhKmeUABl9wKyaCYhN8BGhPvwZ3sNzE6Q6d+I/DCcB4g=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DB6PR10MB1845.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:6:39::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.18; Thu, 18 Nov
 2021 09:49:38 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::852d:c54f:8414:3276]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::852d:c54f:8414:3276%3]) with mapi id 15.20.4669.016; Thu, 18 Nov 2021
 09:49:38 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Support Opensource <Support.Opensource@diasemi.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] rtc: da9063: switch to RTC_FEATURE_UPDATE_INTERRUPT
Thread-Topic: [PATCH] rtc: da9063: switch to RTC_FEATURE_UPDATE_INTERRUPT
Thread-Index: AQHX1cQ7sjXG0JbRWU2LRDXmCEurQawJF5hg
Date:   Thu, 18 Nov 2021 09:49:38 +0000
Message-ID: <DB9PR10MB4652B6E80362D2865DE9FCE5809B9@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20211109234750.107115-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20211109234750.107115-1-alexandre.belloni@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa1ede9f-c535-4c97-cad7-08d9aa78bc6f
x-ms-traffictypediagnostic: DB6PR10MB1845:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <DB6PR10MB1845F2482BE4AF78F0694431A79B9@DB6PR10MB1845.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:773;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lpB2j6UNC/+k5PQFtZ8Va93jnJ+/Hwa/ySzE+2l3n48WbSicnnMfwvjofMCy5t1wYRKRuFEIUBNOmZF86G70r/UJRgrf2Tsiwe76FaQs+nHfgTlNbcaLByU9sqNjA3YgwtIzYOuQ5Q1TFyb4BR0WsEYaduYL1ZD4yQNLvLzT+2qFUaOChXKGMjkOpqFEmeYTZk5w8nvn1xnxjnushkz5tyZxaL5oLUEFlcXs3kDm1BFbdEjMYZzB/NcGIv3XUgcXsyo1vzF20D4dw/0rc+Lp+9m1NefETXKCt4fQnnXc+tbvxrWMx9zM2hEh2zhFCPcZTa/2Ed8v+XbuKQC7i71xWLUEh3TqKX+abaVC1+j8inQSYthrUOBJMR0n0Oefnb5CU9pIw9npuPoKJTseEvv53GvQ6V4/57M7udhHYSVZ4pDgRMbvQ3gnFu8v5LeiCE90nNFj4F08jHOQjIO3oJ3wR+86x125LMV4qft9tmmV99JiiBaIt8rxD3uQPynA2E+Xh1Al9x2d7B1F8u2fp2TCAQaULHOVHk7GzJwePgmhVPA6rQ64TG+1VEjP49osOBcBSqMSzY04c7TddPC3ck7aOn6JrWpt0KL/W5y9RNIZ4OSLsXwJgCtlVcAWTyJkcC/fNzGMv28LJQEr0qn6rNaEcEHcgDd9pOfsfD8RtUyCszJZ46++fEUSZsQcim418AtX8KYw3mRsdDQB7oy33CV7GQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(64756008)(6636002)(66446008)(66556008)(71200400001)(66946007)(5660300002)(66476007)(558084003)(6506007)(186003)(110136005)(4326008)(38100700002)(7696005)(54906003)(76116006)(122000001)(2906002)(83380400001)(52536014)(316002)(8676002)(33656002)(8936002)(86362001)(38070700005)(9686003)(55236004)(55016002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?g37d7ivqo+7v2VRwXcVt6M3s/QCR6swCYZvzd7xh1yU3YtNpfb+AD1sOKTaD?=
 =?us-ascii?Q?HDdEF2guJ30f8LJpSaIvzhiaPhi+W72UvGxJwu3Xnh0dXLkdiTZscv50euBx?=
 =?us-ascii?Q?JQkIZTPKhmqnGI3O5Z7xDHWMxMjWK7XmNT6TpAfg3mb4oDSuLdiKYAiduZv+?=
 =?us-ascii?Q?JRX+Mg531SSjsHzJK3uq5RXw+4hz5+9wtOYDnhtbBG7eyL7kN/JK587oTiXQ?=
 =?us-ascii?Q?47l2q8NCpq32jKrA02ScXfVsU5bMQJbNt4ENGS387usiA+hjFsLKWiCtFiAR?=
 =?us-ascii?Q?zM27mtUdgWA+WBG4O0bvU1FTc739sxENIdv/hy4OKhsANQ84QkknalBMYn2l?=
 =?us-ascii?Q?OPW8ZLsm0s2oYpWJ7wP57iBjd5gC//uOy3+006vBUmwiw2BFYFSyWG2mAvTd?=
 =?us-ascii?Q?S6NHPempZgkB/0mog7CGE3csqdHNAg1KZWgKuUfRgyMDRAwaK4+GshojL6i1?=
 =?us-ascii?Q?RbJuY3W4z2LOkNmnNj034VdciZ00NDwU/ErKclVRY5Hm2innkHG49Dndmh7X?=
 =?us-ascii?Q?rJQOePWFHkq3N7HFLztIoFshjhoVRbmiJyc7BVmRXAgIj/TgQ6WasBI2tX51?=
 =?us-ascii?Q?+cAcJIu1T4tY38uDR6lvpupraG7dHKwvTmqcob0vHjoZRiyt5KWBNkZnR9eB?=
 =?us-ascii?Q?WW9ifNCyfUR6G54YTNu5Kp4bVzdJ2cB9Z8cTGEQIVYQLOc/409nlvtEhdPpU?=
 =?us-ascii?Q?nNiUCa5MvBqnYw9CjJLwPnEoAP7mTQUbCCxw5mdOyhtpDHqzODHhHZWq+uqc?=
 =?us-ascii?Q?4tWeVWeM0xsUVaXLn5P4d41kHJr6po3UO4KPZlDT72JxubsiV4G2iEL33Vy3?=
 =?us-ascii?Q?m+UyR9zX/UXWwe8Ega9WkkqlQ9xIYSJ4Tg1ShqrvoIfkz1YSil6JngMtc4X+?=
 =?us-ascii?Q?4//o2M2XbUkiGf9oSlDbAgEC+Q8mB2JVb2Bpp3BwTZrKBD8bSFroSYPhoA6l?=
 =?us-ascii?Q?dAyrgfxC7iS3GPIxcwtzymQvNQJIetHaw5CiiRjIdNAVcHwb1RO181ne3FKh?=
 =?us-ascii?Q?SDtcyoQ8ZIj8960fqtRCAxJAtUHGFTqR2POqAjQWF57K5ZaGU3N12TWZdBMQ?=
 =?us-ascii?Q?ILaDqkS4vSgASpno8dqc/N2dCp12BXAWoqEMFjVSLeGZQ4wRjnQp2/dHQDmg?=
 =?us-ascii?Q?PZEwPft1GhBf2SRdIfP5CzkW3nnKyeMkJTMZSwzAPLlwsxv3dTVzvDpHm+/3?=
 =?us-ascii?Q?nvw3TxCmAHAKZohbYZP1Cuad+OFLbozqBUmhKKPJ5dE85GogRgY3B/EGjWPm?=
 =?us-ascii?Q?Gf2C1RyZMlJr5OkcfmKgvVwlGb0e49g55NTliWiH8djY1wyOYetxZgnii3mb?=
 =?us-ascii?Q?1qbKLlVqAjq3SZ/thMdsLbl1XYlLpO21Rq5V9uLTnEWXQcR4XUvSX6WzBJWW?=
 =?us-ascii?Q?0j26JzmCgiyhsgyebUUp+Zniy0YSHFWpqguMcnNFs/K6vJIYUlmmffPa60kp?=
 =?us-ascii?Q?MCqShcIJirlw2Wx3niK6OI8mq4XQHcAy1F6E3sdmTHLXZfaOQmL3OV7Wpjaw?=
 =?us-ascii?Q?0rcnNajglFFX/VbJk9+wbp9D5a8yCbp4J6QLyu//wgWYD0QZwU7mLFhh2zkb?=
 =?us-ascii?Q?Xk7EiGPqqS8Tc/HMBGTy4cJ+hAzfleo1Z62Z3LT6YRPPrmdQlQI4NZxIAwbV?=
 =?us-ascii?Q?b9CuzIgMXxzlVsdWG9c2TU2TmwZUw5PxhBMP97vr7S0jVR7Do+X+WKmSXpmt?=
 =?us-ascii?Q?tlN4xQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1ede9f-c535-4c97-cad7-08d9aa78bc6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 09:49:38.2362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AUnoTQrybzHiXE7M2ZYFBTyesLqwfZeAhMoD1zy+Kihs2kGsnZszlhvTs8PbWuffUvlSrN6qWlw+uUvbzyYvDJgKq+3aWuILD0AsOMcJQJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR10MB1845
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09 November 2021 23:48, Alexandre Belloni wrote

> Stop using uie_unsupported and clear RTC_FEATURE_UPDATE_INTERRUPT
> instead.
> Also, let the core know that the alarm will truncate seconds as it only h=
as
> a minute resolution.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
