Return-Path: <linux-rtc+bounces-3316-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8B4A49341
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 09:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8626E7AA4FB
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 08:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB4A2475CE;
	Fri, 28 Feb 2025 08:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XoG7ePs3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2068.outbound.protection.outlook.com [40.107.104.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD2F246327;
	Fri, 28 Feb 2025 08:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730717; cv=fail; b=dNzN3pqtuhR44shjFAhB7wZypcbkFFWnSoNenYbSy6CPqsnL52Ut7CYLbP3pnwEIi1OMVmNnqtS3Epy7USr5Y8lVMcinl+Gfp00yV94BS1354pmdD8VM4YKxcoqfG4gq6ZSaBW4qxiCpq7qNNf/yzu6/LIvn1FhdnAgD9VBsGWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730717; c=relaxed/simple;
	bh=fcwD5zWKrpfyZYW0beyldDG4XBC0M8gdrxKTLUpaOjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nuUqhXRqgd5YfaF1slP+Bws6MtYksh6yiQAWTHDV1MQxOr70RUTDoqtt3T3GRKzND7E+sb4xorZCQrZjt1WDFewQ1rk/YkYk0EXkIj7o8U/VfHqEV+CHgIXmZzsuRox7ltrSYl2B081HO1nZMC/ZAEGwPQrJ+CpvYP1+yDLptOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XoG7ePs3; arc=fail smtp.client-ip=40.107.104.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uR1DNjJ5CRQp9QpPnoSc8GVM5beOFT7fy2KPIv7hMlYBGymm0LvNVRs97W9xKj6BAeLOewhGHDsPmF/wkxyVJrCdEK1LSeLXPNFgPwZCPIKJsSdwHoozSyWlYKbxRdILAnxMipfvlWKATnV2sZGl2O0CxqSJoM0o+zuH7GFGWpYpx/bmCFZfQtDsTWfvNU7R5z6abxSmwUnt0K6VmTSN4KVqhjQ5oyWCpTKAwcDwxH+PhzbwQYyvCnJEDBgH0Gfsh9ufFdMsKk8yXCw1qE6UeHF8BhSbtNa8lDr66U6y4yzVIzj9HARcd92u74zPTTMJuGu+NysaM01Bflybe/943Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDzHChIZASs/2o8/PGtaK4obI9bnYE+zAI0tToZUQRI=;
 b=AYQjd9Q/BWuuZd/x4iKYEAkzMQ1b+CHY5ym6ODSB8Yk0g34/VyzMvLatr/N4AZ0DZUwwSs9wybL4zGslJ81TkeC5yZ3+mqqAC3dFbPWkM1wELgLSBG8S/jA98nfKAsxUTd4IL2DBiElIRC7AnjrD1S3JRzNPVXXUeG7RIxxskaj9IEOuxZs0TgLMY9E96aZg9SvEIfd0NtA0lqA6owppfxnUwiRIFm3aILmjKVLCPag4JPhM1ESaWCN9ub9zMG1Fplcn11/l32Xv4cyM68pGUzAcJyJKOmyWCXNGdbACzvtHC38jjgnKCbqNngQ5+qPtOkmUzu0o7vjljnCeKiEZtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDzHChIZASs/2o8/PGtaK4obI9bnYE+zAI0tToZUQRI=;
 b=XoG7ePs3wx3ZDkeBvzdWwQKNbseb97kyr0CfrcxoephsM4X2FnZlck6/WCSOK0mwkIJ0tEqRUq15n1Pd1L4QAJ/VPt+D+/DqgJ9hBxwqXd0TaLSswm6dHQcR6lZXsRFhawh5k3ePeiXNX92EtNRVWgM4zaKTo6yARagorpgdTfdj9qyIPxGaK9vidg4v5M+wfzewsVLT385Fx+TZbm6zJzXfRdbYgGbJLBKTK5UwpfFvS2hZYeELsaoIPvHDh2Tbk4Tj15HpbKQMK+zBqT6GcXWYV+5Lf4bbeyvci9jAxSPJlsoYK5/nbu6mlMeU+xRvm4Ehr8IfXjr+EnxwZj+rgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PR3PR04MB7305.eurprd04.prod.outlook.com (2603:10a6:102:83::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 28 Feb
 2025 08:18:33 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 08:18:33 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v8 3/4] arm64: defconfig: add S32G RTC module support
Date: Fri, 28 Feb 2025 10:18:11 +0200
Message-ID: <20250228081812.3115478-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250228081812.3115478-1-ciprianmarian.costea@oss.nxp.com>
References: <20250228081812.3115478-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P189CA0010.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::15) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PR3PR04MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fddb241-6e12-4bb2-f5d9-08dd57d07de6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWdUVXdYTTVoTnhRbzFNZW5MOURJdS9maFVWbXRXYnJnR0ZYc1hpL3hJMlNK?=
 =?utf-8?B?K0RlTVJ0c2orOERMc1RoSzNjVk1ac3NtdDVFZ2xqTmwrQ1RPWTR4ZnFvdng3?=
 =?utf-8?B?VExqVjFIWVFmRWlnUUdRSWR5ZmJtbFdJcHI5QWdNYXZFY084ZWJUaTkzQ2xr?=
 =?utf-8?B?c2h1bVh1bllOQmZzY3Z0RzVTVUxxdTN0ODR1WFJpa01KNU91VkdVa2Vaai9S?=
 =?utf-8?B?czM2L2NSTVg1b1F2TWhLSTVIZGIwN1cvNSt2Nmc3Q1pCeVBVQW9kcWZxTytE?=
 =?utf-8?B?bWVKRWdNeTRUcnl2cjhFTk5DUkRNcENUaEVBMTgyV0xSbDYwdXZNTXZDNmN5?=
 =?utf-8?B?MVZ1WDhwd1ZSdHdiV01HbHlqaXBSRW9xUElXSGkwSmlIODNNNWNySEo3U3BQ?=
 =?utf-8?B?VHcvQ1Y4enY2dGtiMUFobEJiM3dLeFBqK3pSaHRycXZRTTNRbkFEL2RkY2RB?=
 =?utf-8?B?OGVDZFROU3BZZmpXdFFiNW5XbEhEU1JFOUFabnJQbEMwU3FvdU9LSWpaZVdG?=
 =?utf-8?B?SGJ3N2htc2FKVHdYVHZGbGp1eU16REc3VUhxY3dqVFNzMmtERE1UaGFkOVlj?=
 =?utf-8?B?S2YrTzd4dGwzNG4ybUJUNlBQVGIxQmJzK2FlUEFNbE4xOWxLM2llLzloNTF4?=
 =?utf-8?B?OXpxZDJzK0NObmplU3pzS1VkZDhoWW12djNLNFZpeGFwUzhxV2FkQUI0cXoz?=
 =?utf-8?B?YzZPYktjTStjVXBmcktuTDlJR1E2YVhoZ1dCZm1MaDJyMXdma2JKYTM0RlFV?=
 =?utf-8?B?bHBTVUFxY1c4elc4eUN5ZTlkcSsyOXJmL3NVUjZhd3phNmRKcXVuZGJnYVk5?=
 =?utf-8?B?MzRoNkpaMzR1S1NHb0prdHdqMytQUkMya2YrVDlBZGRLdytJRGNXS1lZYWxG?=
 =?utf-8?B?c0NiRmpIRU83czJsNDduTzZ0a2xBUXBndEtZalZPR0dtQUFuZC9YSlROVkZ2?=
 =?utf-8?B?Rlkwa3RoZ2Y2YkxldEFEMk5yWWNUWXFPeFNvdnhPczdvUjlELzEyRElqY2p1?=
 =?utf-8?B?RHFJN3pBQnlGREQ5RmNJZDE2bFdwREpBaGI2VGZTcXh5VllhUHNoQnNvSlZz?=
 =?utf-8?B?MlA1MjJpN29aUkNWMUFuZDNUaUYxTXBvMDhrcnFXZndZZkxGNWhiYmhnSGJG?=
 =?utf-8?B?bVY4c1lSaXhjYmhxbW1Dd2pEZ0NQcXJKOC8zVWdwa0Y4UENzY1lCa2U3czMr?=
 =?utf-8?B?QXljWlZBVmlPZ1RYYnpMSWdvT1hGUFpBTHJ2NlAwU3dmMzJiei9ycEk2eWMr?=
 =?utf-8?B?MU15OG1uMGVrZTJZOHQxc0diOGhQeWtmRU14YUxPY2NhbHdYQWJWM3Rqalo0?=
 =?utf-8?B?WnYrSzl4Nm03WS9NdTA1dWNUbldOSXZueTk5aFhjM3NsWlJUL0ZGdXUzdklQ?=
 =?utf-8?B?cXJlQ2kwaTZYMThIU2JzcWEyM29vRHRSUzQrblZYUVRZejJsaENONWlGUS9q?=
 =?utf-8?B?S1lKaytyNy93dFMyVzkrWW9mMUZtcXpaVVF4UkwyNDdPazZDRVJ5SjlsSWN3?=
 =?utf-8?B?SGxDbW5Dai9nVUFWeUoxOEU2T3YxWWh4WkhpRFJubjNTLzF4ZkZpNGZaMzEz?=
 =?utf-8?B?SHdKN3kxWTdHakRLRmRVb1A1aitieTRtc1liRGJWSXRYeXloMTBjOEhKWER0?=
 =?utf-8?B?Nzhyc0ducGlUbElxV2dtQi9TenY5WTNpemZqb2N1TWxqV2lTUmdGZWxqZXZO?=
 =?utf-8?B?WWI5RTkrdUdGNlF5WWZLWldaRXZBb2twaGFQbk1xVTlVNEVqeWlmZlAxb2g0?=
 =?utf-8?B?WG9qY0xZSGEzc2xnR2ZoQUdMVUdpYnNLQmsveWhwS2FDNzlNOFR0WUJTL0dO?=
 =?utf-8?B?Ky9lMGZDRVhYQlZidW9YTExQRzdxcUpBMkxyVjVBVFRTODJWRUFhblBrNUIz?=
 =?utf-8?Q?ezl2mtefRXy0C?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RURCalFZWHJTNy9LV2hDb3lPOG1jQmk4WHNpeVJEaXVjTkY5WnBUcTluWVds?=
 =?utf-8?B?aW9xNjFhMW9zdU1JQ3AyZWdjWVBMcktZNzJFNVdFbUQyREtYNllJaTg5cjF3?=
 =?utf-8?B?TGMxUFhRQ1BLYTcwTUVRU2hwSTVTV1pabnBmbDFNb3lsdDkydVZYcGpFaDI5?=
 =?utf-8?B?b2hOUlIrSDZIRG42Y0lRSVkwUUQxNG5WUHN0MEhCZkJlQXRkLzBXeDlmY0ps?=
 =?utf-8?B?WjZsZ0Y1UGZiTVdVYVVJU0dlQnRWZmdiMXFUY3lwNHhpVEM3ck9oek4zeDhx?=
 =?utf-8?B?Nm9pUERTOTRudEhuS1VVR2s1bmM1RysyMEI4S2pkT2lpVS9kei8xUmxYWjBx?=
 =?utf-8?B?WnJVMXJia0xpOEU0Mkxad0tkVEwvWmVaUVcrNkJONWFTRWE5MXZVME5WSTJG?=
 =?utf-8?B?emhPOUdCYUQ3WGJ5OExSaEZ2eXhyRjNBbUFXRitEeGJTb3lKbXNZaVpvdTdI?=
 =?utf-8?B?M0lCd2tFN3FNNTl1ei80RENMQUVRMTc0T2tQU0w0RHdxZ0ZTN2RNeGxxaENM?=
 =?utf-8?B?blV6V1NZaS83NE9aMmRlRUZVTmlkYWcxY3FDY1NhalJ5TFYxVnc4TWhvZnJM?=
 =?utf-8?B?OFpjcG9WVDFSYVROSjZ6ZHlhMGV1WXR3Q0tqbUxEQjFrM0wxRzU5TVp5M1dQ?=
 =?utf-8?B?cEVJbi8zQmMyZzhJNHdoejVyQkl4THphaDBsek5ZdXdoMUJjbCtkNmoyc1gv?=
 =?utf-8?B?R09Rd3YrZUxTbzQ5NnEzTVFJVGUzdHd5NW82Y3Z3Q2hOaFY0aXBlTVlPRHE1?=
 =?utf-8?B?Z2ozYXhLcnJ3U2hGbUFidGg3RENlOTR0MXdSZGo0eEl3SERkQVo4T0srVDhC?=
 =?utf-8?B?alJaOXpqR3lPY0dIdkw2dE9WanFSb3V3bVEvd1ZlVVBrRWFWWGpSQmQ2WEtH?=
 =?utf-8?B?dnAwQkJucGVHK2pkdW5LOXZQMFIyL3A1SUNEeE9wY3VONzB2SnkzMEVkZnlL?=
 =?utf-8?B?Q3BzVjg5dFU3UmVTbFdmVS9Oc2FOeDcwRm1lTlczRzYxN1I5OFd1OVVub1dm?=
 =?utf-8?B?TE4yTzlkRThvVEoyTHNxcVhpZFRYTndwWHUvdlRnR1RQRnhLb1dJVldZemNX?=
 =?utf-8?B?M211L3FoR1pBMkd5ZExhTTdnQXlSVmxCZG5lZTVNclBVYmhqSWplelppZ0kw?=
 =?utf-8?B?bUdBcFBxazhjdjVFckZMUHkwTzNldlpzUXRPR29OdmJtVW4yM2xrSThuYitl?=
 =?utf-8?B?UnZuSkp0bHhMTDlzT1BXL01VemNSQXkwZitLVzFaYzJBM29JcGFSSHpqeXM1?=
 =?utf-8?B?aWhNVCt3Z2dLaUkyY3RqU2NpOU9GNFRBd2ZDcWJZVklQdEVHeEl3NWttZHVj?=
 =?utf-8?B?R0lOL2ZSTExQRG12YXhReW1aRG9ueGE0ZWhPZ2svUUcvc2hyOG5pblJKcGxR?=
 =?utf-8?B?eHB4cXptWlR3TEtGbWg1aHI2aUV0ZDBPQlo2NUpoZjVSNzRxZUxhTVZkV2VO?=
 =?utf-8?B?bndDSTRpaEYwT1JEaUFvVkduL25GSS9HQS9DT2tkL0xzWWJsS0sxVVpJeldD?=
 =?utf-8?B?d3FPNS9Qejk0UXVMekdGUnJycjk3SGxDRzh4cWVWOWdSTy9VZDYva3RuT1Jj?=
 =?utf-8?B?K3o0Yk9IY2RoMHZsc0daS3ltUUVpYU1sbis3REE0V1FXbW9hWXR4OWg3SndW?=
 =?utf-8?B?dnBZOGZSOFRvUnM5NnBpM2lKWGh4NGV6M2tJOWlOYTNJWi9HdUFzYnBIYlFj?=
 =?utf-8?B?VnJUVUorZ3NLaTJFM09WaDVIOVpGM0FDMzI1eFN5NExxSTNKc2pRM3JnSGJI?=
 =?utf-8?B?bE9vNW1DN0RRQU9pckhFU2VGcWhQOXJOc3drN1NhTnQvV2U5YWFjUkp5bDho?=
 =?utf-8?B?QVJ3RlFpb25kMk5YODVvVjRQOTdMQ21ZUVNGaHhyZ3oySGRXWnRvYkt3QVFx?=
 =?utf-8?B?eithZ0F3WnptelpndHNlNFBsN3crR3FsYmdOVVJrN0pSc1M0WThkYkJ2YU5C?=
 =?utf-8?B?Y0ZibHpYbmhtckdZMTNoS2x0V1YrNEtCRlJrYzFRTEd1MjQrL3hrbmQwUC8x?=
 =?utf-8?B?MFpGdkRvbk1TZzNCWTFkNHpOSVQvTDU5dDIvbTJaQjExdys4eERVWFdVL2Zo?=
 =?utf-8?B?dS9ueU1LM2U3Z0tJcFRzOVMwRkY3cG5wcFd0ektRQk9Ncm9aTlJuN1lBemlu?=
 =?utf-8?B?YUVpc0xVeHB1V1NwZy9VTnpuNmRPRjhlczYrUkpvSzhxS0VCU0Erb0w3U0tQ?=
 =?utf-8?B?ekE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fddb241-6e12-4bb2-f5d9-08dd57d07de6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 08:18:33.4981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UB6PAmFTmQpCjEaln5IN7dHeDXiwnE2NRtOqtRNAW+J1UK6UUdlMw7Sv9JRtZfRxUX8PGvImRkQFar4EE5mMjeb7t0JnqwMlZGKI4+FttCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7305

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

The RTC hardware module present on S32G based SoCs tracks clock time
during system suspend and it is used as a wakeup source on S32G2/S32G3
architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..c24b88b0206e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1227,6 +1227,7 @@ CONFIG_RTC_DRV_DA9063=m
 CONFIG_RTC_DRV_EFI=y
 CONFIG_RTC_DRV_CROS_EC=y
 CONFIG_RTC_DRV_FSL_FTM_ALARM=m
+CONFIG_RTC_DRV_S32G=m
 CONFIG_RTC_DRV_S3C=y
 CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_SUN6I=y
-- 
2.45.2


