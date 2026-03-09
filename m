Return-Path: <linux-rtc+bounces-6159-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNkzDnrhrmmoJgIAu9opvQ
	(envelope-from <linux-rtc+bounces-6159-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 09 Mar 2026 16:04:26 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B75523B377
	for <lists+linux-rtc@lfdr.de>; Mon, 09 Mar 2026 16:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A4353034E2A
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Mar 2026 14:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E193D668A;
	Mon,  9 Mar 2026 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YScFFGAp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010064.outbound.protection.outlook.com [52.101.84.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8CB3D6492;
	Mon,  9 Mar 2026 14:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068362; cv=fail; b=JLpaeQbC2EByjssPqGQjaFkcaOJPlunfTYPptyW3DHy5929+XEt1RmGubVPLiPCsEyz6uPrYOm8fYuucyagFn+h6bHExAZHK3OH3k2ERod5P/xMEiQummUxpN2TxfA/kuhlgJ0I0VzHS1OSLoKrik/y+y4kHUaCEDy+rLVFO+yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068362; c=relaxed/simple;
	bh=qQ8rFQj0CjaYrdouNQMjx5N9pPVg9O7Do5RcAwFVV+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ozpIZ2n4vt8dz9JgJjOYWozaEho9FTLQfuRO6EW+MLZrHuYeM5WEQc4ASHYzeUDmdqxN8hFrwy4t+YLht1DtfNknWa5idsONxgJjSd0/PqO1dlQPar4GzhKTpmKYMPVGq/SUSelmPje/aYlMwr4WL0V9gKVK4XBRI9WDoq03m18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YScFFGAp; arc=fail smtp.client-ip=52.101.84.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkDCg7uLWa11h3QXNyQLg8g0VoAUySjTLhBm2E+wigNmL+ZTmOd1gzvgy5DhAaeJ4iY0dDEGa4AhtFqmDwJfyosqCE5ln6jR7riRKriaLfzddgq0+zQu0pelqbD8oxW+QlocXjOLSybz2VrkaOrz2s+BLqyFRi/4yg7ff5GKKRHg/vNXmvvQ9YCcblmBK99woFH75y0aotq52KW1AC146a/m2WEmB3dx0zPFtAKaaV3RubUSnVXRt53psgrXc7bdng6Mqyv99UnSI5I0p/Vx8mHu7v6Rn25AGVmny8IYpBwg9xd8D2an9fbLDK/ZGAJL+ateBVc+BV1b4Fkhb1pTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hZT8pR92P8g7ZnylyNPTw2wPDME6AW8Pn5A70MWxv0=;
 b=vMubR82bdrSYKAiWVn71W0gS/hmJQaaqypbZfg2YPDs96Yo3PcBXOJizJ2Gxj28G95MLuGHf9Qo1n1/6gxltSg7sRM473OhBfrvku5ovTmbwL7K//fbsIW754Gh75RseCnKpYMa/S7aP/BnJtqfsqOdlOTlPK8wT+2UlOQM+BD85vf+/LkJD4HDZNeJlGJgPfBgFanomNuzS38Xs5asBrHronyofbxsf8uP0RZ0sBSBHOnH1caqrmQot/ywbk+bWsttzsXRLbnl3XPkRihUXqUezehKJcfZnoQxXMDXD901CLzlMhBe7YrMPs8keOSWxoXT+PjLawgmP5fqRM0i8DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hZT8pR92P8g7ZnylyNPTw2wPDME6AW8Pn5A70MWxv0=;
 b=YScFFGApVGvFrAi9w/8pbVYj0266lvopx/HO7HmXA12kusQttxB4KO9gkRR69RD2lv34PgszSHNJPFnJjbu5TPpVWOuMcsvO+C57pHBmxynKhHAHcsgN53OFAjKRwrOHW2RVJLTzUXcb61k8NUMPTzdFMqQp7VSs8n2RZ0V1H9Uh8rO8U2m3kLY5D8pSIs0p8sUhnwxIkwNoOycsDIOdTXUClECypfij/jg4Sl27Jjs8STd5wBja4HZO2YD4S3pXSFVcPLd2bT40LA6skAsxxJx5rmWrwN+Gqk84IlNtlTFHDQ+nUqHsyqRSEFOXhNOKhMf+plQnWPxXmBn55bhZ+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB10595.eurprd04.prod.outlook.com (2603:10a6:800:273::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 14:59:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 14:59:16 +0000
Date: Mon, 9 Mar 2026 10:59:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 0/2] Kontron i.MX8MP OSM Devicetree Fixups
Message-ID: <aa7gPTBL1BuwdQ4B@lizhi-Precision-Tower-5810>
References: <20260309085749.25747-1-frieder@fris.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309085749.25747-1-frieder@fris.de>
X-ClientProxiedBy: SN6PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:805:de::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB10595:EE_
X-MS-Office365-Filtering-Correlation-Id: 749d0f0f-63cb-447f-384c-08de7dec6f1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	ZcRQIzm4grBhaJjfBaP4RMF2j09rw37WFG2HB7aHdTkSpS0w5dcn5iMoBPZ/LiutHJ6m8JDjiuW39elQdVXUoGbctONQnOf/h/WmRhUQzfga0ijTF5bg0UhenXPkRPd2DL5bPJeufi8mMHNgX5gy5NkYsmMmEnf1NxVv8SBWIGRdYmCl5l8/wEdBJ+Ikm/o6xEl/ayZGibIypuLJ+latBbv9/EY/TNLkJJ0NcZng7GtWm4Nvu65uLNg8SvFG2708vtG0NjnLteZtoiK1f/KRryC+UqrlvAwFLo8XfCMrF+aGsfOWT5mPeaIe0jcimgvc+aD068WhoeoRzsqssdHmLMettDXU/cVFSpL5cshBmKplr6nD+obkqarV99pjfc7fL6Ja55aAAP+4zAjCgKNjiwGPoyATj4LhPJv0X0P9gbiT7HuRJoRNBe/0RbORYl061R4MLNjeATvuObSEAGt9iauB4O3xEKq4q6t0t6ovsoEl6b4Ejz5FPW34UJrPY0Bbe4hkfO5PTMvNh9RG7jp4ckqu2kNI33uSTzEFxxwyiA6g+rXD0raY24qvRDFxrH951uKrYqgIGOqzgCr9NVb5pymKEf2XGsTA5yhlL0/SM5bC0D8VkYfDGcXx13jB1/lMpFiSAiM4Xu2CcxuOn1HKa7QI8G9z0kPfdr+oVfVekJNKXhdglgJaK3b5Tfsw4GpkS+kSvXyW4vt00uB3f0Sq7n0+D8lUK2yqpwYBmTx3Q8GMuM6fkLjrsf0pyjfkkAnMkEEBlPvAAyCRvpycGDFagAg5W9y9cYLRkegi32VXXAM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PFPV+Vu35Gn1Dnc36U+Q90SvMCGyhjAwOONcOzz5D5pP5RQNxgfSlGuVo6nY?=
 =?us-ascii?Q?nt9zNMGqaJrS9gEW0pyH5cqlbCkalgdUxtJd/3px+XQ/xxuhqs+bD9yzPjBY?=
 =?us-ascii?Q?yU0XnoBiJwqFt4ySdfhqYhSkUPeSQt6DQ6vIlyPf+FOh6VkZQd1LDeIgizq/?=
 =?us-ascii?Q?bHcQU7dhSGVewjZgUDdNxxqS9yHLrAzQObPN8KYqX/k7xhRVf+FW/R695gXA?=
 =?us-ascii?Q?/GLF8d9fsJQNM7ZmVvoHD11spda37207+DlA81tYAMWMlBaqj3cS9sSSoZ1X?=
 =?us-ascii?Q?PPn8vbpdd+jO7vtypYn+YagPEowPKVCVDIOZeChev/Kyx7IBuMXi/ljmTUK4?=
 =?us-ascii?Q?Ec3JcnYuOffdBBLOWny1GF/WIoStMdee7eVwsD7/7POJLs6CdW/wZc5tzFyU?=
 =?us-ascii?Q?n7xjpBpc/chS1EuWRkimUFzquxGt8va5wurFWvKvtf+IfRSLNnsoWVpGtZoc?=
 =?us-ascii?Q?gOAyqPsEWptJGitwBVDuq1zPw4xMXC7QSZ383PLnCigbqnFYFbtgcRO1sONa?=
 =?us-ascii?Q?c/S0kJNm0Yhbpjnf4iJKcm4w/Hu/RjtvVejH0vA06WeSODUQO5rQy/7JEXs4?=
 =?us-ascii?Q?dsgNCHYUPjvHRE6+WkUDIPvQwDnTkjQ/GUQzj3Jciwonxfq2/LKrp4ruMnyR?=
 =?us-ascii?Q?pKkusGAfUGqwm0Vd+DX5gz2I/rBAwakS4UE3R54vMDQ+rSDUcu9PzzekhbaP?=
 =?us-ascii?Q?uVjdeThIwSXGIY59q90NMcdtWGADGeVfNVJv8/nBCcG+2siszODB8+5jWUE9?=
 =?us-ascii?Q?ohGdDdbNEBmFEcnWOASAkDtJTr9S+Quq3C7G9BOmiOO8BJV2IgU3m1wNSrLs?=
 =?us-ascii?Q?ctkhgBl+ceQchipX26AtVN9ji6LH57lvt4MZsJ9azDBYwX42QT5o3BmudBYJ?=
 =?us-ascii?Q?fWT5faxoh67djJFHlL4OBhfVtIVLOuERjE7fbSLjKE4LNrqHIX75yj9wBBk2?=
 =?us-ascii?Q?ppCqJHGYVVcgMuggozIXGSGwNRH6XlIfLGocH72GQ+K2F+EcFVEtbArUKpYt?=
 =?us-ascii?Q?BLkIt2YXKe4Klu4KDsQwn06yHGGmtcbQlcSfToLFLKrecq3GWsdL7J229d3k?=
 =?us-ascii?Q?V3IkDbLIWf0w4XnC6EsYis7CFmV9OJWfD6vsmZeRs/5FLIJ5ZzuS8mXprZcf?=
 =?us-ascii?Q?2bRxbqTJhU4YFKWFBBIjkODan+z2Dik+mlT+MrdLACpY0R5SiNOfmp+RNkd3?=
 =?us-ascii?Q?ASCmH0wTxvgs9Dy0NbFQ8KRIlyTRElspfWJsG0uaQRyhW/b7LYViH+KpnkQu?=
 =?us-ascii?Q?efU0vGO1jEHHMINry8RPDWfqTluegjeV3p8V8Vm/RhBuMZNQH8VEAxT4Zjnm?=
 =?us-ascii?Q?3jX0NIqupFNsn0KEala7n9fSGKBZVC+PHvTS6IfXcrJU8/k6g2ZZVdHl8Ii8?=
 =?us-ascii?Q?AzZ4U29LLBwtDUKt9/FwPekAeNkbYesnJldstEpkDpuyWtbXj0wyUPJWHWmu?=
 =?us-ascii?Q?DTTzuqgEWNpWbXcfhTMl1DwJ6IK5gPmLe9C3wucmHZvfPNPferLzqgNVu8ZV?=
 =?us-ascii?Q?I3ncHaiKLiMK2JPOJdE0wz6B/zJxAenj3xOfRh4pOuHw0lGyeA9YPngh2wDh?=
 =?us-ascii?Q?gt5LhnFbiySpbUCtL2mz0wSDd39Cb/4xbigWGSYXgbp4LhjZ/UwMzKH9hX6E?=
 =?us-ascii?Q?TpFlD3U+NkpBGzX7PbdIjKJtyflOsDQFh7+hxYtbKsIbVyqdneqoL7R7t8FV?=
 =?us-ascii?Q?zXxwaskdXoaZe9cO2+yB+S3EpHxUltx+T71OqYo7j5wmUK4c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 749d0f0f-63cb-447f-384c-08de7dec6f1b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:59:16.4817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0ULpOPLi1w8EWE+iuFySqvRVs2AowrNnmwpClX84+h+gOAivY6dzUZ26NqvDbjbYd+2aw2LZFGtlvd/KilPAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10595
X-Rspamd-Queue-Id: 8B75523B377
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6159-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,vger.kernel.org,kontron.de,lists.linux.dev,lists.infradead.org,pengutronix.de,gmail.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:dkim,linux.dev:email,kontron.de:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:57:41AM +0100, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> This contains three fixes and one cosmetic change for
> the Kontron i.MX8MP OSM devices.
>
> Changes for v3:
> * Drop applied patches
> * Add missing bindings patch for RV3028 RTC
>
> Changes for v2:
> * Add Frank's R-b tags (thanks)
> * Enhance commit message of patch 2
>
> Annette Kobou (1):
>   arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC
>
> Frieder Schrempf (1):
>   dt-bindings: rtc: microcrystal,rv3028: Allow to specify vdd-supply

Please include this patch in imx@lists.linux.dev next time. I will not
track this patches status. If it Acked or applied, let me know.

Frank

>
>  .../devicetree/bindings/rtc/microcrystal,rv3028.yaml        | 2 ++
>  arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi     | 6 ++++++
>  2 files changed, 8 insertions(+)
>
> --
> 2.53.0
>

