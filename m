Return-Path: <linux-rtc+bounces-2402-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A00229B8059
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 17:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBACCB22CC4
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 16:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579CA1BE87E;
	Thu, 31 Oct 2024 16:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c8Huos25"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD6C1BF7F9;
	Thu, 31 Oct 2024 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730392782; cv=fail; b=lgMH+KbxYprPExXFkcO0ebzmvWC++5JlJL+Og8VgAyWXxIjW+cFV0Tv9cwGQ8I9zTQaJbbH6vK8UKcOcN08DNJwkKBY+1+cP5+LcrePGq0/XxqC5CJMa1ohInlLKrgdc+wOrOj/Zm4QBm4hZ5Yo6RLuH/aFrlup9PRZg1LM9c/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730392782; c=relaxed/simple;
	bh=EVM4QozZ8LAQPxDqaucvv0zaVmYWYa5QxUnjFDmBVC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UIq+MtmdwyXLllIoqNg3s1viuzZjMgDdJMnNA/0sB/KbWIGYBKxRvoMUR9a7CMtgETJJtwwAWgnYeHT6TcakTIbCMPhzJWj4fE8qwlGAYHrkBjxn89p3Id4u5QF5YREd0FeZQY2fxAP+1J3vk1xqo1elfXTnPhgweypISl4SeJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c8Huos25; arc=fail smtp.client-ip=40.107.22.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icAHdMpixzt5wLmw9iFyXVbLGmsOwMOdwExXVHVQW7A10L2xno3SVHLzXAc/AZ5AKfikLNtjr0iArBGHu6OR7+j8TMet2/b8lMWmS893c/1zxn0IsNTF0U9IHit93rGFSKdEJcOksuD5EBb4LgWfNs5wdK9QTlvV8MMGubMSdssN5YBm/FcrMlH0J5gDNkC3inOTuJmhVjJFF4fFaYtyvKspLLGb5xykZRWcSMF1BuoOkwZsirHZKOIsaGThwja5sbsyrk/DXYJPSVfdQN01REYFph1xS9mvcF7PEvh1h5sZBweZhlmSVXTs2Z1x7tsMcEM04NF3OZWodAQmfRLYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIrVvLsHj3eP9WO3Jt3d6wo/IY+hmmkP/dlATpGk3OA=;
 b=H3w59wKBu6WHumFyMWi6Smt8auXq9RsNVKbMudvh2C1EkjflshqOTIUCRZT5hBTQyIPD/SAtlpfzll2pRR8fGdFV30dJJwNZ0NU3Fg4hUGu8c7t2ZcIsCx7G/T2C7kpW2cspIv3pG+zFOO1bNrzk5czHyLTVRypqz+sbcF0jis9i2YvHPjRnEsTJ268nVocwP2O+r8WlGtIjlKd8OPPtHZMc+rND+JtiXCNlUjnXjwv6Zh1FXvJrzlfOUewpnb8umMYa35xqCFU1v10Cogzt/y9fgcnIa5UEt/vy3u2xv4rpfOy5KAMhTv55mWdqAdcNwUkGRSJIPSUu6svGQF+rbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIrVvLsHj3eP9WO3Jt3d6wo/IY+hmmkP/dlATpGk3OA=;
 b=c8Huos25BZmZx4fYg8gwl5ccnQu+2fePKtE2rJU28hlqYjR5+tHvFzBaawktSDrtK5+nDophfIYqkxFOCQuhYwFSnYC2h31QTAyF0MWjgbadeM7f2aLv3KDrKsxfBIv9aGvNlqUnpFxqAez5IGf693Jj3i53pUPreIOQ2Hp4lQvrNxf3xsSNpz4BzkHrYiH1O8GuhEq55FRDv+W1CC1FmdB+BM6AhyA3UckxXmKdPAnZd5JsUXcd5yQrxgWJZPdQw5yoBh7jy8UuDPhfHJTFlqTjGCnEfVfTRqthftK3if0sxvUct3clf1xv+8ixuSE5jE5vm1b3DrkZX3dZEDhW+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB9487.eurprd04.prod.outlook.com (2603:10a6:102:27c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 16:39:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 16:39:35 +0000
Date: Thu, 31 Oct 2024 12:39:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
Message-ID: <ZyOyvgw0qZ4YKwTi@lizhi-Precision-Tower-5810>
References: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
 <20241031083557.2156751-2-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031083557.2156751-2-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: SJ0PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB9487:EE_
X-MS-Office365-Filtering-Correlation-Id: 23adf39d-8884-4fad-2487-08dcf9ca9a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TyYuSpsyGKIl046IFKQsvZwVLv/RAYeB7yKC1maR8/J0TOMDX9Ic/eQDcTT8?=
 =?us-ascii?Q?YAUUlPWJKvlhejch7acJHtT7fymG6A/her0ZnBaApKBZZy1+pe9nfWJAHpMD?=
 =?us-ascii?Q?cPAzIogOjDxjqbj+hqHYjuqjFQd8ZuRJpj67jtJrbXqhPSl4VPWNVfXekIAr?=
 =?us-ascii?Q?TneeSUdUjMYKrGloGrF5rOeqCJyOgb2I/l7nJgHOmlDIZU7XCa7Z41QyIa3U?=
 =?us-ascii?Q?q477zd4LyJQ4Y/RC04mC2J9DaXyGYQXvvetAKSR0EH5jtMNYw6Ow/353G55k?=
 =?us-ascii?Q?TzeU24kUwdvoxQKW/fa9afCi6gbId8uHaqMubB+yv4i3mwrqKnUR09bYEvbi?=
 =?us-ascii?Q?6aiS9oUcsFmBoKFyzo9QSRstFC557c+FD1YC3AznHLIkeCWSVos5KFipoQhM?=
 =?us-ascii?Q?RteD9GrBDLGyzeAlyaHeCJ6t53uilBTN3UFmK9mGWog5QXWcy2p2368lPquc?=
 =?us-ascii?Q?dn2jZluBaCqqdON5To5fjBUXtVvogWC57wNoapCPdtSLGNJMb3EqIz/P53P7?=
 =?us-ascii?Q?9cVbnwBZdb9kqjtgU64bXewfP6meq/Jcnbzon2fWkTfyJx60hSZLnogNSfSE?=
 =?us-ascii?Q?urG3HVVzrlTsylYxPmHDnOOyMF0a5veblzSJxuQTwpNc9YFkRvRzV9MkMyMr?=
 =?us-ascii?Q?iQLd4de6wcMtB1/Q3DaOlUBt59cSTgS6Kt02IIiwyiObYHJqNK3GRJVAr3GX?=
 =?us-ascii?Q?GOVtPhKt5bjheOFKKv/DtG8ZfQofsYa9JvmV7Bo0FLaFUJu6tdEJ8bQvABBz?=
 =?us-ascii?Q?KLpMTSVyx1zd9kE1vejKZhKhOVgiSVOTDZDYJx6KnWrY/5Buj+9wTVhRqo6L?=
 =?us-ascii?Q?U4ljLRr4ZlX0NcGaF5hov4257sOz9UDtvTymxYhx4uiI+MUoYU7g/bIpcJFf?=
 =?us-ascii?Q?LDZS5TBYyRflux3zw4RU2vuBiGJOIwhWNbPOqMFGkgDBy3LFLtKpalu+b63V?=
 =?us-ascii?Q?DI/tuT0KHfITKbcpg3flu2iQenn4Qwqx4gHtnn18eZtBzICOOgQtvh0IxJPK?=
 =?us-ascii?Q?ARzKz7Nmrx4NLeSZweOqCVwuun/0ZL51YZT3Bsj7L1PfwHLgfUC4viW1q9Uy?=
 =?us-ascii?Q?lYnqHJUlFQZuUYczLo+6bZf+MsekBJaJpsHPUYOqvDde8cSoGGYabe8La9fC?=
 =?us-ascii?Q?T023N2VMm96ApCsWMjMgEGcKc3ptd1wm/LQxdb5p/MVcHj23z8hNjulNmC9P?=
 =?us-ascii?Q?ooBBjdxYdORr7qJP0MK0gfxDAwMwC9sE/tbB7dFtaqvxg6yNpJXlBS3vtDZb?=
 =?us-ascii?Q?z7qsr+0z06yxbwcnB3MfJFVPRpA36LxUV6Lha/YyE0fc9btLvIxNWoh2Ia15?=
 =?us-ascii?Q?eC7ioZ2iT3xPAOKRGZ89gElW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o5Ebiap6YRnK+ar+f3WdmjAn3/DColZzijQEZBJrabjZJR6VghRpdpyszkTp?=
 =?us-ascii?Q?AmMVty2QXRp8Q4A02MGnrQDm6QHvnryNW/iqRfRCNySVyQLtxu4KIegXBE93?=
 =?us-ascii?Q?FOnV04vsEaE7N4U64TGyBq7UahwQ8PGcxIecyETt9mpfUoXSV/zPIK+H21dz?=
 =?us-ascii?Q?V/Er5tU54aJuGp/+wfTPc5iZfjoqk6XBp6FNj79c84X2Dd/jhB2leYjXQS+9?=
 =?us-ascii?Q?YSvCnED/VoeyY6WvhuiJ35HbfPQOxckaXmwImEDhWVGUvhoRZ2kMV0yMlhrq?=
 =?us-ascii?Q?r6+rPbmm9F7U1gYecbJ7IuIFyaQPFRSKdslGH8CanF+ywHWT8lQibzUEFwg4?=
 =?us-ascii?Q?qgzSbeH2TuzolxXMyN02+3Umkym/1VVeE7ejRujAN5qOwp7SHo1KeLJlVhU4?=
 =?us-ascii?Q?5G6XoF8IH4hl7KuLKB2FIvTm+vfhYgccvEuLDL9YyABiwyR3ml7auxDAqUrp?=
 =?us-ascii?Q?5EPUQ4MKApIeki8eaIh55pKTPm5bvozQZsDs4r3LLi+TeN+KP97fCxW9h/3s?=
 =?us-ascii?Q?jflahVjU5t4bP/ezJSe0b1xiBEMK4trLJJaPs5NWW5Vj6pfRm/ZWrNJAwCPp?=
 =?us-ascii?Q?l5KvY7Ur1bU/XaycCllWZRJxE74cRN95711abAk5SFaYoOuEVzHpLCp7bDvX?=
 =?us-ascii?Q?xqqb8T0q2tX60bKIsgo1Ut+xEvbk+7zyvddvR51g0R87uO9py5qSJMjWguXF?=
 =?us-ascii?Q?Mr8KLT3ve37l/w3mR54PnsotsLDDT+g1EBLj+Hk0dSlK/i/8f5t3BM73v2yR?=
 =?us-ascii?Q?vyh4sI2tPJdjkjNViW7rRz8wIu9wPBMXo3lHN7xihfin6Bbo52l5fMIood5d?=
 =?us-ascii?Q?I4vPgie7te+d75UMBYeW3w/nXby2Q2q6396xlXnxtHYrTZdiEHLGnHLooryd?=
 =?us-ascii?Q?pCKa+AbenE+HAxBR2zBmr0u4JxXIbrRXsgBPeYZ++WHOj+ZCXQufbIVSGitU?=
 =?us-ascii?Q?WrP8/xRpGNQVfuSlN3g6ydnGRrRCd+Jz/VVQFJCQpZzNFjvfirOoAmpIC9kb?=
 =?us-ascii?Q?1tpvnH/z2ifUWRYQptI1xNm6C/lfgVnz0SMY8dieENO/6BKVjufxkcLhf5hx?=
 =?us-ascii?Q?gcwd1r63hJHfvfLZXdgywDXrBLPMUu779fwkxzB3rPNXI8T0inBF9H+b0UrP?=
 =?us-ascii?Q?ciC1Zorp5X/xEEdOTDucaYhBbEYZoA2QfDzkdW1yWJzK7TaZKwtksJeXXAbN?=
 =?us-ascii?Q?j9yw9SLjfG/0K0PQFXCTHOSLipb/CCgFuzocojQjytm2v77rvWc9AIwfKfkU?=
 =?us-ascii?Q?3onFdfKO0L10r3OsN/tcGumsnslIIErWu8A2ZQPf0czXugEdIFbgE/xkxWU5?=
 =?us-ascii?Q?q1S8ptz1sWPjEGrH2gjCVG1veWrjBlOKmV/X52nwIs5l2hRf6OEP4AL0kOy6?=
 =?us-ascii?Q?rLyOvx5Wm681IMZAq9yhv6eMrIvZlqMMsKwrPkq0OsEzlLLcccyzaVLFT0Kw?=
 =?us-ascii?Q?IiFOOdknjrs+ymBCyUABiuyIuHp/Uo0h69ENwEMRwDDsPFyXd7/x7p66gcw+?=
 =?us-ascii?Q?s5wgtgq6RbooBt0Qgs0k7DLb2qUWC07wJOUp5A1SKitegRC+pM/HiEQ7Nncr?=
 =?us-ascii?Q?84AFMuUr8OEN2rSMqIiNqiOpaIvMmhwZAs7OXbDa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23adf39d-8884-4fad-2487-08dcf9ca9a5a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 16:39:34.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5wjKxNMCnV6mxjHmyBQTZDEgjhLDU4t/xtTucXkeIS/JfaJyJi/3fD2b+USULLgY8bmPow9zrXfTBeVAMvNyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9487

On Thu, Oct 31, 2024 at 10:35:54AM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
>
> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---

next time you can cc imx@lists.linux.dev

>  .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> new file mode 100644
> index 000000000000..3694af883dc7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2/S32G3 Real Time Clock (RTC)
> +
> +maintainers:
> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nxp,s32g2-rtc
> +      - items:
> +          - const: nxp,s32g3-rtc
> +          - const: nxp,s32g2-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1

Does your RTC is clock provider? why need #clock-cells

> +
> +  clocks:
> +    items:
> +      - description: ipg clock drives the access to the
> +          RTC iomapped registers
> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +
> +  assigned-clocks:
> +    minItems: 1
> +    items:
> +      - description: Runtime clock source. It must be a clock
> +            source for the RTC module. It will be disabled by hardware
> +            during Standby/Suspend.
> +      - description: Standby/Suspend clock source. It is optional
> +            and can be used in case the RTC will continue ticking during
> +            platform/system suspend. RTC hardware module contains a
> +            hardware mux for clock source selection.
> +
> +  assigned-clock-parents:
> +    description: List of phandles to each parent clock.
> +
> +  assigned-clock-rates:
> +    description: List of frequencies for RTC clock sources.
> +            RTC module contains 2 hardware divisors which can be
> +            enabled or not. Hence, available frequencies are the following
> +            parent_freq, parent_freq / 512, parent_freq / 32 or
> +            parent_freq / (512 * 32)

Needn't assigned-*

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    rtc0: rtc@40060000 {

needn't label

> +        compatible = "nxp,s32g3-rtc",
> +                   "nxp,s32g2-rtc";
> +        reg = <0x40060000 0x1000>;
> +        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +        #clock-cells = <1>;
> +        clocks = <&clks 54>;
> +        clock-names = "ipg";
> +        /*
> +         * Configuration of default parent clocks.
> +         * 'assigned-clocks' 0-3 IDs are Runtime clock sources
> +         * 4-7 IDs are Suspend/Standby clock sources.
> +         */
> +        assigned-clocks = <&rtc0 2>, <&rtc0 4>;
> +        assigned-clock-parents = <&clks 56>, <&clks 55>;
> +        /*
> +         * Clock frequency can be divided by value
> +         * 512 or 32 (or both) via hardware divisors.
> +         * Below configuration:
> +         * Runtime clock source: FIRC (51 MHz) / 512 (DIV512)
> +         * Suspend/Standby clock source: SIRC (32 KHz)
> +         */
> +        assigned-clock-rates = <99609>, <32000>;
> +    };
> --
> 2.45.2
>

