Return-Path: <linux-rtc+bounces-4055-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E76AAD820
	for <lists+linux-rtc@lfdr.de>; Wed,  7 May 2025 09:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87D0C1C22268
	for <lists+linux-rtc@lfdr.de>; Wed,  7 May 2025 07:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7546921C18E;
	Wed,  7 May 2025 07:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ll2r1LwP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406441A9B53;
	Wed,  7 May 2025 07:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603069; cv=fail; b=CpULupuxD644pezYeU41L8ietvprRh6wPI7ZpHsTFaMLqek1mpLXruCEW2srNws9zqx+JfBopiaBbY2hSHnisZe/nmPhcRpcTzsUuJvWNJcTgJP1L2bY9kFvKHwUTrT7vKaBeEjGBbVl10ccCFRr8U5cWhrgOvOeq7ot3MBLhtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603069; c=relaxed/simple;
	bh=cykKM++N7Ttmq3ukYFSEoWq+NhPW8db3E4xyCfrdNUk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J57sIzLO9NUsiIwrjZsNUndNgBQN8IYqsru+zoH9ULk3bi0VqgRFiDRHXXTTl9EekhyQWz8jyRaSFPjPxKKoySsl+rPW+SZYlrKEcL4A5UVbhzs4zp1VxqudDpYy8oXgpuaSWeXOqrgZiMdX5Ah88p0pBd07vg5Tye3PRQ1yhXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ll2r1LwP; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtPh1zEE1lcFJmUHyn0sweh6+/BAbWd5L8hwcyTos6SxV/pGkQ7X4M4NFahpMY3XZg/VedqNMIoE6TtITLDhTyoN1XeOoIcvPW3Hy3HuLv+JwxYibHx3iZFZ5tSk3h9cfawJuMG0AwsLvtbijCjn9DigRbSbYr3bvTp7pCTH80corTDloK1gb/nmPaIc7Ak9WD6qhp7TGKHsWI4EtzMfNnjbnSB9sFN286tpCEiBBMP66JungzrUlQMI3AFCAt16alsrHq0bf1oB8KUrCjESc/yhQK9nJ2jhPhdKqJxmjTn4Bj7Tqb+xSTejwhTD9E8MsybCeljLD5ggwXu0sXk1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGbLxZ8EhTAK70ThQ1nQhNeC0hgX/SeK9N1oN2gffBE=;
 b=aN0IfZq+oeyHoNb67TweAXfwsZUxmbPCGM33w2l25KkRjCHsbNeSldKU6YkFsx0enUdcnr0ZVVklBdJtx/D76RpKXjlG2iIVzD+CAGA4Mn5D2SdnlybmZKW6lcf2csgZGEjgjTck1BXpmchSzcPotvRv5jlIjxP35OoOCbEe4RuTmpNIK6pbjqLNyNQRdGIKNGLi5gcG4zEkGBCf2nZ6nb737N7eS4ZU/IRxxUDMTKFo7hAl2/eTGAXg9XId1X27ueziLrhxOhTafw8WejxwRXPxgS3xiV7HhgThm+3/CoI3mx0+5yrzBfNPxbgsnWzsU7MIC06KL0DoE9WmM7ngbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGbLxZ8EhTAK70ThQ1nQhNeC0hgX/SeK9N1oN2gffBE=;
 b=Ll2r1LwPak7OjtDjHTKiS74xlhLBbgfQTqIOUu7QYbhPcj55eB9DYLbGJ3pUhRdX/LRNlY9rYGRRfNeZ1Qz/GEubj3yp7kRyxm/nxx3Em7IobE3hA2/CbRxPA/kUpFuEyjeULIQZUXUx88xKBjorFR8QPU3ezJSYOJdJHHfZ0CrghogihUIgbxuMD6InrD5EgFoaMjq0+mIAD4HyBvCfLgksuabr3MAF7Tvu85spMMnpQWOhVk94+zb9wucvP7NpVAOBpV4gpLJd2VhVNMqlqRCQ8BR+wBotc/fvAl51dhlGZTaGf2uHmrVyz07oOo6KVwuBE9RHvGbMg7KCuvY2UQ==
Received: from AM0PR04MB6515.eurprd04.prod.outlook.com (2603:10a6:208:16f::10)
 by PA4PR04MB7854.eurprd04.prod.outlook.com (2603:10a6:102:c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 07:31:04 +0000
Received: from AM0PR04MB6515.eurprd04.prod.outlook.com
 ([fe80::ca11:63b8:aeea:8043]) by AM0PR04MB6515.eurprd04.prod.outlook.com
 ([fe80::ca11:63b8:aeea:8043%5]) with mapi id 15.20.8699.024; Wed, 7 May 2025
 07:31:04 +0000
From: Pankit Garg <pankit.garg@nxp.com>
To: Conor Dooley <conor@kernel.org>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, Vikash Bansal <vikash.bansal@nxp.com>,
	Priyanka Jain <priyanka.jain@nxp.com>, Daniel Aguirre
	<daniel.aguirre@nxp.com>, Shashank Rebbapragada
	<shashank.rebbapragada@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2 1/2] dt-bindings: rtc: Add pcf85053a support
Thread-Topic: [EXT] Re: [PATCH v2 1/2] dt-bindings: rtc: Add pcf85053a support
Thread-Index: AQHbvmwEyq44ngbwY0OGh1sJZwWSkbPFv9cAgAEGdbA=
Date: Wed, 7 May 2025 07:31:03 +0000
Message-ID:
 <AM0PR04MB65156BE2EE9C7EF14991892CE788A@AM0PR04MB6515.eurprd04.prod.outlook.com>
References: <20250506094815.3765598-1-pankit.garg@nxp.com>
 <20250506-durable-cryptic-24119a6e7dbd@spud>
In-Reply-To: <20250506-durable-cryptic-24119a6e7dbd@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6515:EE_|PA4PR04MB7854:EE_
x-ms-office365-filtering-correlation-id: 46ce92b5-d6a1-4b2e-ade4-08dd8d391fb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?drjRmyKl4tqgg9KXcsponZYWgZl+/05/cWqS14QyyaDh8/qCDT109IsREy6G?=
 =?us-ascii?Q?6GoHDk7b9ycPzxDsHH4mCYkc929cJW070AnQ48zxf5Mv9XnUeQHCP0zpXyik?=
 =?us-ascii?Q?wEV9YXswLcGn+/TcdFlJ0+PoRjz1n6qqcggJUA4mhCo0W342IlRKUfSwu+mO?=
 =?us-ascii?Q?BCswhzY5jFg2M2kDos3eGP+pE+1cv8y6rl1BXimpInnf0aUMZFxvEtT7f1lV?=
 =?us-ascii?Q?DvQJ3jbhSjeQY/OOyKndLS1bQAsfCmAMyY3b89cj6e/3ApY1jeSAjLwkF5vq?=
 =?us-ascii?Q?myQMGX/m6wutzKctggbnqvkY80/Idjo4QK2UdYpkNCPcmV9OBvgQAj6FOdpB?=
 =?us-ascii?Q?Sa6qtPkti+J1gkSd5ASpL1M0ZhJ2aji5kXGufwSWv84EPGAN5KtbaYvloTJo?=
 =?us-ascii?Q?npDGTaXXYS0v7Cgpdy7fii8CLqizJ2/3LVXcmS1nvTbIhqcGHk/ebAyEFK4x?=
 =?us-ascii?Q?KJHzdZ+xk4K55PBaKhbdEF+SZcDD9zZ/aGwaWk6WBQn0T83Ro0mFlB+aQtJR?=
 =?us-ascii?Q?oOoRjzBDK4TAqRgUeqU+sprBhps53f+kyzQiIz4CEjDfIX4HB7W0U4fow1Qo?=
 =?us-ascii?Q?jSyd7FIyIJxpZ3nlDpxCpriMbonSjGBaxZzaHX91dZR9kduz+qBJoj96w1Cc?=
 =?us-ascii?Q?1R7ZokgjvSmNkCyhrCM44mFizt8IHBa39xDvEUPdEePPr8SOjJs2Ue4pTZZ6?=
 =?us-ascii?Q?3scU76SvpDDUfistltAJ4zP3zVLOFMYjfY6m5ip4XOp1aq0MssbYOftlGxy8?=
 =?us-ascii?Q?kcefpNTlxqd4xbDLcaK3Rx3zQNX/UnjeJX28jn2Bo6I7cIpRhkAgGSIc8wJZ?=
 =?us-ascii?Q?l8GHon854B+tVljAhNcPRRh5MkmUXhPyTOKoYlKuVPtko1zj73SqWWqzYlRK?=
 =?us-ascii?Q?+XXwaTPmVquZZxlSpkJn+QgX/6BKx3AmdT5x+VyMmE4WT9IJkqVBXjAYPsty?=
 =?us-ascii?Q?+xz9/9Up4ZQU5p/oC9p6JZGxhBozvQMPmVa2yYjezXXutZxcz9yzfwZ1p8LM?=
 =?us-ascii?Q?ailqj2173pfeqxijAA2oNeMJUYuldWCUmLMAEhnOX9itxfZvF2vdOVQ326NC?=
 =?us-ascii?Q?6r3N2gNCRp1JfOxi3d38y6OWCO5syiMut8p3rofIu/h7J2gAS0tOeViMIsAz?=
 =?us-ascii?Q?59xMqz+XzP1favcse9X+LEJc/yN8XPsEa4jwc0VXPUNID5NVJd0Maj/eZg4t?=
 =?us-ascii?Q?5vH8PT/MdIPKJ1ievdN1VpN3iOkWcaJrP+aqicW2Vzpe7ghSW4azQ3YHsaEC?=
 =?us-ascii?Q?QFVWA9JSt9SgSaIuKa1Vp0ny5ZZsiJJBAsSuaMKlsIoP4zijH0DKfGLZRJbD?=
 =?us-ascii?Q?wnNiXkF5Kf9MZX7g+eGpCcjfJf6ctKXlON/FO5V47JQRDuOLuN7S6d2uMyvy?=
 =?us-ascii?Q?o5BPcyK31ixfpiiT87Ed1UB5IGmj064+BX/9wAxoYyE6rYlMFctdp3ksBAkU?=
 =?us-ascii?Q?1ByA6MFcaqen1XikZVMZp6dYbsuM6zPt9pNLQGuX+hyNZfbekSyv5mB8gJYn?=
 =?us-ascii?Q?ER4Hkk7c/8MU5Rg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6515.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9SNLuFJwPHq5v2Cf8XfSsskMbUFGJUG3BFzwhuSsdEwrDNGM/Y0M6XJSuDWv?=
 =?us-ascii?Q?5eHksH3kayfJay7GllX+CCJFp5R1QS8345s2UnRv+yCrJ0190dTLrZ3H0i9H?=
 =?us-ascii?Q?685CYZS8NAMkwYA/wjTmynq00y/ifompNumzwT16dDE/Y7Ca7GLcFzzzK5K9?=
 =?us-ascii?Q?BLxfJxilvfVr8c48Ve72d1oqYaR0ypRnjWX0K/Q60mcHmn/5c+ntJj2k4RAz?=
 =?us-ascii?Q?laAY/0pAYF6JWZv4QRH/ppZQHonQE59tEVypm1isQ/UmRSP4s39GQBZoRGDu?=
 =?us-ascii?Q?W9ra/5WLzvCnWwci+9Uy6QDndjFAjtYG1FCQosVB5xxTaoVGv0f+KakMYusU?=
 =?us-ascii?Q?F43fNgB2jKnDWLOmLTVXIMwcU+RwHaQFVvSmYZ0DgdmQJQh2SRF8DVuvSOdR?=
 =?us-ascii?Q?B/5HhlNOwh6hoeOEAaz3VonJau7O1HdGSItIXwkt3rfK00W9BGYNbRraB5jC?=
 =?us-ascii?Q?WSKufHj1zX+hulNvXodG8Vw2koyvhOqJSfv8p5CypJapGCy+NZfVRW61/27A?=
 =?us-ascii?Q?D8yoOsArCFiyOi40aBfcfXJVrgr4OncVh3z+Iy2QdHxKJ92QM9CL70trXk/o?=
 =?us-ascii?Q?CWQ0FMuE5uqxy9SrEXaHCj6hDYWX62TzjpUPhEgdIEN07EJVhdvcLX3KfLD5?=
 =?us-ascii?Q?eIQ+9NfEKxrVu12OniFoOcu36WBpFT8Idnq7ABJGwZoyVLBBDcRPYgdyNsuD?=
 =?us-ascii?Q?7npGgYJRoVQfRA7Oa+BnVUM+dbzqwUKhUXsBQjf2O3xFq12pKiUocVcMZBuy?=
 =?us-ascii?Q?JPKLECwujkW8ZjTjf8nLVq4s9T/Q2NVNvpOEV81n3Ovfw05rNYLBW3R8kpSq?=
 =?us-ascii?Q?TZkuNGa5eBtqgXxRzuhTvNiotZozlxyypCwKxtgQplsuZwnlAsnf8I/UEV+s?=
 =?us-ascii?Q?FsJWogcuHd3xQxCL0iNEm+DrP+T3ArxF4SqpqNB7JoY2dp4nbWhduzRtB9Me?=
 =?us-ascii?Q?peZKNoOHzIz1LJe28z0tLm9bcXDMLgGzMEu9kFq29AUwciGmiBlXqDTE2Cfq?=
 =?us-ascii?Q?0p1rAk8tvXODuBFc7k2cUwFpt9FRbf/l2LC1QJyVjoOiy6RnOqynSTnkmgua?=
 =?us-ascii?Q?bYGr0I/eajaUDfkpShrw/tZbr7ln4Z2xgcke7C9UofzdzLRvkdplIP5lGVhV?=
 =?us-ascii?Q?5MooDwhqlh73cFHnOQ8Yf3XrbRdbeJnjPoz7JRX5OLPMOzJtPzQDgdwQFcvI?=
 =?us-ascii?Q?ujI/tppgmvMo6Ota5h7qjmDp4Ykng0+U0NXTSWhYTx1APM1sXoBsmurOIR5e?=
 =?us-ascii?Q?g9NlbfjV9CuHr24Z5lOBMh1pJvTxst4lm6/Ik1vDBKwlqae+TltnXRy2EuqM?=
 =?us-ascii?Q?MLxKejRCh0US54UYlOenu8w5aNmNdr5hU1yA0IvKIk1SZHJ0F8ALLERFMsnF?=
 =?us-ascii?Q?I2Nx2CL+122WLuZ2ykDpXOp8Fie9BZY3bEjHnyAmZnpgG7LLZzRqTK8Vga+Z?=
 =?us-ascii?Q?AcfNpYUYBUgmaJzYAbwZwQg2Kp9JBJWvW3sf97LoXuOXZAu9/5FsNomTQRX9?=
 =?us-ascii?Q?1ZGH1KRYiQ8MK/mougi99lhQG7ba28Mw90oQBqvOvjHXmhCS7yt8N6+LGG7r?=
 =?us-ascii?Q?2xDeS78ReEO2z/cK90M/vgnF/bv9ofTKDrAxQMrL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6515.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ce92b5-d6a1-4b2e-ade4-08dd8d391fb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 07:31:04.0864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cZ09XNHt6lZe9I/N7Ebj7Pdz+DZk4o4eNVxeeRCfyk88GVgsWsy57FHJFFdgGzlAlv4NLSM4Ag3+PsT19Dt2zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7854



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Tuesday, May 6, 2025 9:19 PM
> To: Pankit Garg <pankit.garg@nxp.com>
> Cc: linux-rtc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; conor+dt@kernel.org; robh@kernel.org;
> alexandre.belloni@bootlin.com; Vikash Bansal <vikash.bansal@nxp.com>;
> Priyanka Jain <priyanka.jain@nxp.com>; Daniel Aguirre
> <daniel.aguirre@nxp.com>; Shashank Rebbapragada
> <shashank.rebbapragada@nxp.com>; Aman Kumar Pandey
> <aman.kumarpandey@nxp.com>
> Subject: [EXT] Re: [PATCH v2 1/2] dt-bindings: rtc: Add pcf85053a support
>=20
> On Tue, May 06, 2025 at 03:18:14PM +0530, Pankit Garg wrote:
> > Add device tree bindings for NXP PCF85053a RTC chip.
> >
> > Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> > ---
> > V1 -> V2: Handled dt-bindings by trivial-rtc.yaml
> >
> > ---
> >  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
> >  MAINTAINERS                                            | 5 +++++
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > index 7330a7200831..47be7bbbfedd 100644
> > --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > @@ -65,6 +65,8 @@ properties:
> >        - microcrystal,rv8523
> >        # NXP LPC32xx SoC Real-time Clock
> >        - nxp,lpc3220-rtc
> > +      # NXP PCF85053A Real Time Clock Module with I2C-Bus
> > +      - nxp,pcf85053a
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> >        # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> >        - ricoh,r2025sd
> >        # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
>=20
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 0737dcb2e411..d39fc05c6454 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17782,6 +17782,11 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> >  F:	sound/soc/codecs/tfa989x.c
> >
> > +NXP RTC PCF85053A DRIVER
> > +M:	Pankit Garg<pankit.garg@nxp.com>
> > +L:	linux-kernel@vger.kernel.org
> > +S:	Maintained
>=20
> This looks like a hang-over from your v1 and should really be moved to th=
e
> patch adding the driver.

Thanks for reviewing the patch. I have pushed v3, in which I have handled t=
his thing.

