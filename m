Return-Path: <linux-rtc+bounces-4812-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F37B42501
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 17:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB3B218831CE
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 15:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CEF22D4C3;
	Wed,  3 Sep 2025 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ib65pNuk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372501ADC97;
	Wed,  3 Sep 2025 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912965; cv=fail; b=Wfn2Z1c5sCeKN71Cq6sr7qPVGq53k3RaBOoa7cG+lyF51fFfDDG7tY0lXSqfzUzAJJGcDnvz4Nd496eKmFbs7jQmQ1T+fmGKsGvcQLwDQyqJHqdlbGV4tI99e0LWtdnxz+ZzZ4aX8yQIkVWtpFDWwg1oAMrimGVUsjcixRGbtvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912965; c=relaxed/simple;
	bh=dT5Pw51AG+mwywjHvoEq2FG6hzOKacKihgKfxwvAg8g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gOjf3b54Rqd0xPyx73aB4X96K5XnnQeWLhf8VrQS3NloS47GK9Q1yTlovQozGVD2bSx0Oeo9C0lR6fQ1KrdOYeosXY0zmfu7tVgW0wZWB9ize/E/a6S4a682YuNMJH2K7t4TpleO6CDTvAClGGMjv9nzS94dxmYrWAixqk+IAnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ib65pNuk; arc=fail smtp.client-ip=40.107.94.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G//Hg9LVCmDHYmQLh05WDaKVMcHM+DNWGmWQg4syTz6QxoQFbDbRkMAVk9cI2irWfPt/aCWsccU/pv+zese1d79Owv84S8ffA1EPIzGJSUKKyafQUmeevCpypIujKpDQpJiY216eaSHxZnONV5oTFoEp6DmOrVYj2YHkwGmpOggLzhq6vv+/QX3Tiudgy0lU7vzQcmNvZWH8crbJ0fjJxc9JvSFdgNsw/yEslZu2bjfmUTUtIDtLgOoCpF+XS9w84iR3WxvT2Ru7v9EUkfHlPnlw8ZUUXBcTDksVrMD3tETs2cyAKLBvae6xeG6a4POLVh944MAkjdGI3GH+/hNwzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+f4C4wYAKi/pgU2gaubn+vZ7pG2C7JfEYwNz6R6P9qQ=;
 b=hi/OEFsF/885HQQFKA8cKbFOGdZIHW3y2tvF55wc9sX9tWJaXVUcY4+ql7nRryU3ADDlIuycbGc0utN874mWVnypfofNuxWm8EcwaR+4FiNUiCSihU0lKjAcVGB5MM9D3StO3m4Mi2vEKHwzwdMA7+Qju5APk/lRRF4RDx2teCnyzQMyS+Y0mfCsmwtKaC7RJT0LuS/wNeHebdFM6lORXIYZ2YQj3eiw9gQf1RPJMptdF/4OpimNBmdyPvSh8rzp9SzFtUnrihpcquPy/qdWPDe5ED/hjAqYXX7TEzTtv4J2U/Ud3z4z6qA+kNRsxs9IghiCN+ClfaJbej0v8MIgjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+f4C4wYAKi/pgU2gaubn+vZ7pG2C7JfEYwNz6R6P9qQ=;
 b=ib65pNukbckU8NGJCy+iHp/wZU3N3d77mPrFhNdSrYzcWkzwDgNNW6nnkIBEG3dORyorUp8LGZAiEl6zi9d1UJk8mKxhpRAaopErX3qs/LYLObFdxZ/EvzqNdnqI/JxQKKyYoSrA1XZA38POCFnUadaof0NC6UjDWgwjoifyQBs=
Received: from DS7PR12MB6069.namprd12.prod.outlook.com (2603:10b6:8:9f::13) by
 SJ0PR12MB6967.namprd12.prod.outlook.com (2603:10b6:a03:44b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Wed, 3 Sep 2025 15:22:38 +0000
Received: from DS7PR12MB6069.namprd12.prod.outlook.com
 ([fe80::ee41:f0d2:f9b8:ea32]) by DS7PR12MB6069.namprd12.prod.outlook.com
 ([fe80::ee41:f0d2:f9b8:ea32%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 15:22:37 +0000
From: "T, Harini" <Harini.T@amd.com>
To: "T, Harini" <Harini.T@amd.com>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [PATCH V2] rtc: zynqmp: Restore alarm functionality after kexec
 transition
Thread-Topic: [PATCH V2] rtc: zynqmp: Restore alarm functionality after kexec
 transition
Thread-Index: AQHcAV1AXhRPyjcD+0u9TsGzWke7IrSByXbQ
Date: Wed, 3 Sep 2025 15:22:37 +0000
Message-ID:
 <DS7PR12MB606995B08A344C01711C7BCC9201A@DS7PR12MB6069.namprd12.prod.outlook.com>
References: <20250730142110.2354507-1-harini.t@amd.com>
In-Reply-To: <20250730142110.2354507-1-harini.t@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-03T15:22:17.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6069:EE_|SJ0PR12MB6967:EE_
x-ms-office365-filtering-correlation-id: 71c969a4-aaf0-4761-ad23-08ddeafdb736
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5P62GqOkgF+/oZBJoF8pLL6BBa04iOV5HlfCSztOS1Y4qOOzC5R0zi521zHH?=
 =?us-ascii?Q?d4lJmMAAnTwCi0posQ7AAPmuU5jZOnXGUI7mLjPXf9hIUCMSSg/ujDlZvAbo?=
 =?us-ascii?Q?fdPKUPrGj53MjbaPPS6eIZGBbwTUYVvOsyJ3LHht8hoSesGtly3a+LmDHZD8?=
 =?us-ascii?Q?rhLoQuKJcnjIkCQVPuH/onxtGND4cLtiUeGOwE7dojbCcRCZncBGK3Mlyc8l?=
 =?us-ascii?Q?oZX0r/vPWWmvr8elzPHuD2GGj5qsxmqw1foL66b1F7gtTh+2Cp6RdW2kKLQS?=
 =?us-ascii?Q?ad3NcpeaGBtd16b2/e3LiMoOHQjVwckzXRJntqoCyiGT2K/LQw2DjSqz407y?=
 =?us-ascii?Q?47AEsaYGXoQzouAayca/mTveCz/EVOJ9T39Gip7/eISIgAGJRfeObjj9vq3v?=
 =?us-ascii?Q?xWtXY2Ru9jfzQZoD1xeE6q+Y4YX+LsEVpfT0T6Oilx7mcWKyUwA0o4F+ts1u?=
 =?us-ascii?Q?VWz95RXXbSfx8rxNq5jhhgbZSEs7sh2iEelMRy2G4fuW6AENOQbFvDea59ID?=
 =?us-ascii?Q?6G5legHAIAIzhnXTJ6YAdiITmNuBxhqI3GH8sssZfOQJ6qSyOD3jv6b2GQhh?=
 =?us-ascii?Q?ZPTl6V8lW0wz0QoTtMYnHzLggn3qt0tZeYP2ehShYE1n/KgmHqzCqZpVIr0G?=
 =?us-ascii?Q?QdxrAZbJYGaO3I5ufsg11i1HlcZlq+sl41Ir6XMOADwTj+e0B53oC6zp+dR3?=
 =?us-ascii?Q?C6sUDBxLZxlZeDWta1S288qZNHwdpL/Ikn6D/bxYPRdmqfdw/JEBTYYApqtQ?=
 =?us-ascii?Q?A92DuOK2wkauAFDMYyHP9xVp7VU4q1FPRTZF0vV8cIMEGyLHFTe3RJjG2t9q?=
 =?us-ascii?Q?7kOSdvFzqhO39a6pjhdp9D5vnzb6h8hGDCsFem6wPyFrwTGaUYn+eJmmgpeQ?=
 =?us-ascii?Q?zUmTMbCUmO0wbwuxQaaH7HXutp6bReqkKOq+X4lGa964m+Oi9HDU1Q24DVxK?=
 =?us-ascii?Q?kY+gAXma58wsf4xRd8FFTLzSkmVmULQi5UK5+ON7zUhHd7+CPZqPLy4+7CcR?=
 =?us-ascii?Q?5kXEnWwwhK0BVvjMAQwkPTiJlJrhZbSa+1DcVScuqEhzKUqbkvCWkPGnu0of?=
 =?us-ascii?Q?uSKMx7nMMzfdN6Djnfqn257K8q5mBZgGM26qU1b0g2ilF7xI8LBRZU/vtNGi?=
 =?us-ascii?Q?Ogg6b2NkT682gBlpmgC9BxrsvY3EZTPHm5em63UckJqNiBmckEfVOv/Rm2kg?=
 =?us-ascii?Q?hILt/d+6oP3F3un1lUoL/1JN/AmvB/fcsDpp2ttGmp5WdFsz8aUAwHVgU+M5?=
 =?us-ascii?Q?4QMprCJaG30OE9e+2DXpPGXztciBu5oNJU0ajmMmVLlmABhknbE033vryXGx?=
 =?us-ascii?Q?8o2eMVSPqJhSwTf2s+NgaCBKLe+qnKPZZeCKx3qrEn+XZs17XBIyvo/lwdBw?=
 =?us-ascii?Q?i2OlspvRhUa1t7BzdCbcq2xzadpFjz0rgGON4MZztlrevo8sUitC0AksWrNp?=
 =?us-ascii?Q?O7O3BYooi/noz1FjnKy8czQQHpy/IF0Z?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6069.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yZVeqMucTRKmpdz3zUHXxJBbP0g64IBZb2RK7r8yplZQO55num2t4qev4XZC?=
 =?us-ascii?Q?/QhmJvVD2dw46hjYaa1Jg2nT7bvBFdsDeoJuyXF8eqlcBF2/V9upkeeK0qtp?=
 =?us-ascii?Q?+e2nNZBYVicbUD/P0459FDpg4gMeCjKbmgt+TICU9GxofEiF0fk/RjBHhqF4?=
 =?us-ascii?Q?sMEYIiSyaSod6FTallg45TrqGELhcWySrZHb29dmUaY+779zN7t291EpAPX/?=
 =?us-ascii?Q?lZ79bjFWCKwUtuHBeLIhW/af6nentnylWcT+ZU7odcIoyIZfpwRxcKySzcIu?=
 =?us-ascii?Q?+50bDMLP3SYUs9SxlnjspmMu0q+yRI6JNgZSi4PhgUyz0Dm/b7FNSRAyYVH0?=
 =?us-ascii?Q?qN4HDgHviD9Ti2kSJopalTHKmJKmE76VBzgMJ/PuAJi2GrmcxR6NWahvg9mG?=
 =?us-ascii?Q?I7ZyqOorud4q4WZx0I2AtMEypIy6Z+O4b4LzkN1f30a3wd8g9And7u9sQ6LF?=
 =?us-ascii?Q?RL2fI5KwuA81iLTXj3jOCBXbDoT0lRYCdAH5Rq+PCwQc/ouZ+6qgnkF0tRgi?=
 =?us-ascii?Q?7j7OJRyX8Gqe2HTnsvRd35zx4LXtKIAc3Ie1pdxes6r4f/B8hGTIniqFQoAk?=
 =?us-ascii?Q?3hGlUzWYjvgWz1qgN67PK2CIHkIqSchhjMJ0aLjybw8WVI8oeYxXYNLtw9NO?=
 =?us-ascii?Q?qoBARYHk+fJDdIF8cxV3sE9qkP/1dVEXHpfJr5d1doGxfe4TY7Zpa0UK7TpI?=
 =?us-ascii?Q?mxfp35HQ54sYSnNv47TvKk79mJuGtza/L9OSJyumV5VVtrNC4nj9BRyDQmGy?=
 =?us-ascii?Q?3ReWk1G8uFVAAgmiKDKo5lr3pradwU/T8VuyIwlu2Obg9IBXNuNh9TiE1kKy?=
 =?us-ascii?Q?rwzDhiy6U1HG5e4yDNBZAHWWvzanPl0fG2X790sOROIKxDM3QvupR70Gmhez?=
 =?us-ascii?Q?9mMyNjgJ8XDo5tXAXt0fYacDn9lto311R99Y+ZiSFOkVJd/rM4sC5n1jX7hg?=
 =?us-ascii?Q?sCmNYuefZPFDGeNpr65Bls62pENSpuUpPMmfUwuORZATB92BSFzWiOXV6xxw?=
 =?us-ascii?Q?bNO1wo4M29hfuHJ49UV/u+AtuX4uuzdfhU2dDXWcoipGUCIbLFFWGLo6vRo3?=
 =?us-ascii?Q?FJJu/XQPyXWObfWc5LLRQr548Pyc56/ioOlmzFGhfPx2csusgwbBB3+pWAFu?=
 =?us-ascii?Q?OxtGHnS21ITphbBuG3qOZBSSUEza/GnG5JLRbSM84tf95h7FrxoOJVhx1dMA?=
 =?us-ascii?Q?2C2tQfbWZPqCgXooJOpzAGIDcsSY7iKBkxpafF6CH7tk59F3V7yD7uNEGjjT?=
 =?us-ascii?Q?2qusyHYyO4sUSrff9+cfDzIoJHlURE1fQohxbb63xI+uIYdOBSTOAh2Qpg8O?=
 =?us-ascii?Q?ZOYGrrYqtnQMEeHXm9U3mEqfAilCNUhUTiF8JeNeEBG9Dr8Nrk6M7+e0srgi?=
 =?us-ascii?Q?Ak7UknYdxGXnLmHprwFZL9v/oGprW5GGOVvZwz52pt7TWn0R8kip4mfNipn0?=
 =?us-ascii?Q?37bJW1dM6MF76PY0R94artq7KQNDoO2DYmdOjGZQTcrb31gLMk+TbyAOi/KB?=
 =?us-ascii?Q?3T99KBgE+yOq1SCI4b3ynm6jHxgqqQIJ3BN9J+YO6OFIMaFtJQSFmXuZY1uB?=
 =?us-ascii?Q?paFbSdaijhcr9LTgug0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6069.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c969a4-aaf0-4761-ad23-08ddeafdb736
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 15:22:37.7872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vAXeSXpU7FE/YsHGWoySsa0OxRgfh+IABNeIdsWem0++OAhmCxFYkCiszn19Y5d0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6967

[Public]

Hi Alexandre,

> -----Original Message-----
> From: Harini T <harini.t@amd.com>
> Sent: Wednesday, July 30, 2025 7:51 PM
> To: alexandre.belloni@bootlin.com; Simek, Michal
> <michal.simek@amd.com>
> Cc: linux-rtc@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linu=
x-
> kernel@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>; T, Harini
> <Harini.T@amd.com>
> Subject: [PATCH V2] rtc: zynqmp: Restore alarm functionality after kexec
> transition
>
> Caution: This message originated from an External Source. Use proper
> caution when opening attachments, clicking links, or responding.
>
>
> During kexec reboots, RTC alarms that are fired during the kernel transit=
ion
> experience delayed execution. The new kernel would eventually honor these
> alarms, but the interrupt handlers would only execute after the driver pr=
obe
> is completed rather than at the intended alarm time.
>
> This is because pending alarm interrupt status from the previous kernel i=
s not
> properly cleared during driver initialization, causing timing discrepanci=
es in
> alarm delivery.
>
> To ensure precise alarm timing across kexec transitions, enhance the prob=
e
> function to:
> 1. Clear any pending alarm interrupt status from previous boot.
> 2. Detect existing valid alarms and preserve their state.
> 3. Re-enable alarm interrupts for future alarms.
>
> Signed-off-by: Harini T <harini.t@amd.com>
> ---
> Changes in V2:
> - Remove shutdown handler to prevent alarm interrupts from being
>   disabled during kexec transitions.
> - Add alarm state detection and restoration in probe.
>
> V1 link: https://lore.kernel.org/linux-rtc/20250724170517.974356-1-
> harini.t@amd.com/T/#u
> ---
>  drivers/rtc/rtc-zynqmp.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c index
> f39102b66eac..3baa2b481d9f 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -277,6 +277,10 @@ static irqreturn_t xlnx_rtc_interrupt(int irq, void =
*id)
> static int xlnx_rtc_probe(struct platform_device *pdev)  {
>         struct xlnx_rtc_dev *xrtcdev;
> +       bool is_alarm_set =3D false;
> +       u32 pending_alrm_irq;
> +       u32 current_time;
> +       u32 alarm_time;
>         int ret;
>
>         xrtcdev =3D devm_kzalloc(&pdev->dev, sizeof(*xrtcdev), GFP_KERNEL=
); @@
> -296,6 +300,17 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
>         if (IS_ERR(xrtcdev->reg_base))
>                 return PTR_ERR(xrtcdev->reg_base);
>
> +       /* Clear any pending alarm interrupts from previous kernel/boot *=
/
> +       pending_alrm_irq =3D readl(xrtcdev->reg_base + RTC_INT_STS) &
> RTC_INT_ALRM;
> +       if (pending_alrm_irq)
> +               writel(pending_alrm_irq, xrtcdev->reg_base +
> + RTC_INT_STS);
> +
> +       /* Check if a valid alarm is already set from previous kernel/boo=
t */
> +       alarm_time =3D readl(xrtcdev->reg_base + RTC_ALRM);
> +       current_time =3D readl(xrtcdev->reg_base + RTC_CUR_TM);
> +       if (alarm_time > current_time && alarm_time !=3D 0)
> +               is_alarm_set =3D true;
> +
>         xrtcdev->alarm_irq =3D platform_get_irq_byname(pdev, "alarm");
>         if (xrtcdev->alarm_irq < 0)
>                 return xrtcdev->alarm_irq; @@ -337,6 +352,10 @@ static in=
t
> xlnx_rtc_probe(struct platform_device *pdev)
>
>         xlnx_init_rtc(xrtcdev);
>
> +       /* Re-enable alarm interrupt if a valid alarm was found */
> +       if (is_alarm_set)
> +               writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_EN);
> +
>         device_init_wakeup(&pdev->dev, true);
>
>         return devm_rtc_register_device(xrtcdev->rtc);
> --
> 2.43.0
>

Kindly following up on this patch. I would appreciate it if you could revie=
w it when convenient and let me know if any updates are needed.

Thank you for your time.

Best regards,
Harini T

