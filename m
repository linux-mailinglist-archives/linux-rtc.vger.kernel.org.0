Return-Path: <linux-rtc+bounces-2235-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2BF9A393C
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Oct 2024 10:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BF8E1C25936
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Oct 2024 08:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443E018FDA3;
	Fri, 18 Oct 2024 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pYnE9w4S"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC7518FC80;
	Fri, 18 Oct 2024 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729241703; cv=fail; b=sQYANwbkV136M56Ti43XGY65Z3BH0TkC+h/3/G11hZUkkyj4RHVGXgWxfil7S/oz4Wcrd16lKObgO2yNIOa87s6OxxC2pL87nw584eERGGzJiE7/jhktFQhCn0uc7MZ9UZarQSOiTNrCLnMjT6BOJzYg91sWbCGJ7V8aqx+3Uck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729241703; c=relaxed/simple;
	bh=AoB5ByMe+GlKfxR01EKmHKpb6wrtQOW2pX/t6F6R1Ks=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q14bGKQnBwXgauus3GdefUQLjhAsZJqK9ZDZ4ybiVxrGyrtGbYk8rB9WEAtW+urGsJBKkfbHHDnpamncXQwRR70guR56KvbuL2IDVf3FfOjVpDX4n5opIOa4iMRAtHzXZky6cyeLG6st6rSuywI39/SapvkKFS4PN9/tEoAdIIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pYnE9w4S; arc=fail smtp.client-ip=40.107.21.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBzA4SrjbCX6bMzf3tmmwfUNkxOR55cwsnU0CR3EMRIiRXrILJZc//t+qGHRKDbSP8VZq3TuzSUimsYOldyaSvZUAUtyv1Y30xzvQvqDUJTMaUWwor1W7XsHzpsYp/yIyste+/Wr1gV8PsdfqU8gTGNa8pKkeg4g/AsS9+7xDSF+xQNWX35q8plh9j7AOnOP0LZQp9a4xYMlT3amKeYQeLyGqLxwYomH/c2QNetXPQ9Sj6+W/PKBRDLDV7r4j4CPAQEI+F6MbqEEdAKvvhSoB2ZC/+O/EPIOh13C2bfECAgdWX2MfEVZimPQPfbqxR/5VLGDSR8uxSYKAJzRrtNWhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPMgbtGTK4m+wQtVDVLuT+lZa61iv5Iy+EvCh0a2gpI=;
 b=XOqigCLKyIyGRHppuTLGUBQMiLDg71aYIo17bey7wSk0khyK/jbjDug20rLIS0pCiwQQcpZ1tAQFOCIiv2mfLVU1u+gNE+SL/EOUEXlJCeIRj+T+eRGyqQmTmsXBK2666Kt1CS9XGTbvd1dPBjQK6fO/PkqFnTdn5kxkhdht52OB3wXTrmtMwK1gkgDb4ECrozboNjywngy/uYAug2NAtsRjfn/7wGtHg1CrKkNFEVfc65md3GptiwGXllsnxeqZUK+4Nzn8HDBVc/dxIba+iGsY7/ckpmkwHodLvzM3gjjdss/AO9l1NkUOs5m5L0Je/URo2rtNW48GDY/h3dPXBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPMgbtGTK4m+wQtVDVLuT+lZa61iv5Iy+EvCh0a2gpI=;
 b=pYnE9w4S8830tOEqgYEEoNLrrB4+OjrLPi2RTJ6SWHalUVSyFWSpzDF3hBlTD31Dm+KEkXAp8Kbt8rNcqy6Kqc+rEQ0wR+ctKpCw526XLvJ8T6hcpIFBzSDa71N5rOcyEfAlrfcQZV9/0nPcmsTBlRiRSzcQxWpZfjh+EMUdwWiGmtAvxEBNvZUs0YoH27ePbf1q3vrT2Ka1ZWcDZqePU456NEKRyjpNreV5BCNwaXA3IiY2y+iwn0vHG45ZZYw3t/YPZLrOAoEsuBc1NCxVApD9HTlFocnnGph/nupOzZcOdCI8G5p3F1ewZTOs9iYXPOoQ2tyvWtj5Oxy9H3U9MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DUZPR04MB9982.eurprd04.prod.outlook.com (2603:10a6:10:4db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Fri, 18 Oct
 2024 08:54:57 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8069.019; Fri, 18 Oct 2024
 08:54:56 +0000
Message-ID: <1210ae00-2cb4-4175-933d-8227f9b7a160@oss.nxp.com>
Date: Fri, 18 Oct 2024 11:54:52 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
References: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
 <20241015105133.656360-2-ciprianmarian.costea@oss.nxp.com>
 <20241015211540.GA1968867-robh@kernel.org>
 <20241015212717.GA1983714-robh@kernel.org>
 <20241016160823c22ccb22@mail.local>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20241016160823c22ccb22@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0043.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::9) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DUZPR04MB9982:EE_
X-MS-Office365-Filtering-Correlation-Id: fa9d8853-58a4-4201-92f3-08dcef528a51
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STlYM09OdEg3QVJjcHkwaFlxazZxeWw1TTd2NzRzaDJ1OXZNQnQxa2wzOXVF?=
 =?utf-8?B?M3ZwVlRBVE5TeUpjekFTUkpvb1B0Y0lBUnVWZUNGOG5QQVdGeHFSNkV2UW41?=
 =?utf-8?B?M1laUzBtd3d0V1NwUFRacTlJUlltbjVSbUROU0JDOGI4NVltN2JUQTBoeGNQ?=
 =?utf-8?B?Vy9sS1J0SEtXNWtkKzBCQ2hmeFN6bjhwSHdkbEc3MCtqWWtGUWRFNVdhcEJQ?=
 =?utf-8?B?QVhEbFlFU25oekN0RkhEMUJBV3N2ODd5UDBHSEY3N2pQbys1WVZGTjh6TTZC?=
 =?utf-8?B?RDhiS2xISHoxaDA1eFlVbTRIZVFkVmt0dGRVQ0duRUZPYXpKcDA1cjlQeWRo?=
 =?utf-8?B?cGhOT0NoTTl3Mi95R2J3Rk9OUEZtNklYd1ZGcDZWQjdtM2xodDRNb2x5RERo?=
 =?utf-8?B?cE9aWVRobXVkVFBSNWFLR3hBeWtwZWxGZSswNmJUQmJza3dQV2V3WjUxdy9L?=
 =?utf-8?B?YXYwQzJocThraHZjWGVxZHU3VGxjendFc0lHUlBaemZTaUlzV3RxMXNiVnk4?=
 =?utf-8?B?RHczWjdHdzd1dzVjN1Y5L1h0T2dvTC9JeHJFdmxaT3hkTU5mVlg3L3RLeU0v?=
 =?utf-8?B?NDhlUXRCdjcxWUY0VmpPOCtQVkYzRlh2ZW5ISW5HVFVqRFY1MVJLWFQyRnJP?=
 =?utf-8?B?NG9HZVFNaU1xZ2kzRDhldjlESGpmZE12N3drNTRQd0p5N21nTlFvQ3M1RG1H?=
 =?utf-8?B?S3BadWo1V29UUTdaeFd6SGxaMkltcHhqdnJqK1ZGeDJwcU9GRnhDTjh0dWdF?=
 =?utf-8?B?UlRhT1ZqUE5KeS9pRUhLR1ZMVkx4OEJVYW1Sb2hMTXNIY09pSnBEdFNaOGhv?=
 =?utf-8?B?UU1qd0xSbVpsWHlDRmhMN2ZqbTh4Z2hpZDJ0VmlreEJkcDMyZU9qVWl2RURq?=
 =?utf-8?B?WmY0QUxVcHpTb3FseWVhVlhTYWs5T3lEdTVCbjVUeWgwd1dPNDZXYmRkbUJ0?=
 =?utf-8?B?cXRxMkFERU1hYy9hU2g1d2NjTE1McHdYUWV6UDg2TFErNWlXUE5kQTkwb2g4?=
 =?utf-8?B?cEdBc3JTbDNwN3g4YjJoQVRTVHY3dlBqRGlweHNMdlpjQWpmM2lnTHFia0hP?=
 =?utf-8?B?R3hNeFNIWjlBTjBMZUJDQVBDRW9jcDYvTTg1d0tFUzA0dFJBdnQwNlpTckFy?=
 =?utf-8?B?SmoyVHhYRitlVFlyWml1SU5Ib3BNOTl5MUw0VlJ4L29BMTR6bjlrS0IyOHFv?=
 =?utf-8?B?RnNBMGk3NzBBbDVDOVVtWlBjSmpTZ0l2SUhHSS9YSC95OWcwRFVQUUk5VjZM?=
 =?utf-8?B?blJqdk91UWJUOXJnRHp2MGR3cTN5djNrV0RGcVQ1a09wcDB4aG41bzFTUUwz?=
 =?utf-8?B?VExjaldPYnBjREg2UTRwY0hmQXQ1QTFyN2o5T1NkdHBsYk42Q1lmc2Fzd3E0?=
 =?utf-8?B?aXNuazZranN3b2h6VkRhbGtOWk1LbnF3eUZMRGRnL2xQaHAwc3FIcVhKb1BO?=
 =?utf-8?B?T0JjVGVpbWsxSGQvRjB1N3dFNmxReTBFRXhYMGU5QmhDRG80NVJVei9TajEr?=
 =?utf-8?B?cnY3Sy9kNmRxVFFrSnJMRGREdlU0NFM0TENHV0VzdmhVdVZHRlRlb3IyWVhT?=
 =?utf-8?B?Tlh2U0FEYVdYZUkyWEVseHpJZ3BkMGtuQWl1ekowdno2bjJ4d1VZZTBodWs3?=
 =?utf-8?B?UHNzRGsxeDlPR3FzVlQyWlo3NG84WEx6ajFWRjZlbjkyYk5xQnBGSUdvNzZL?=
 =?utf-8?B?amRXUEtkWklXeHJMZG95d2MyMFQvRjV5eVRDdWQ5b3lqSlZ5ZkdWVi9RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjBqT2toVi9qWDROOTIwQkk4aEVGTjlXTk9CUnl6MmRHMFFneG9mWmdobWxZ?=
 =?utf-8?B?d0dDekp3a24rTm04UjcrYVUzVEVOZzErdHBKbXYyRjd1SXFBVXYrbkRqbWhp?=
 =?utf-8?B?ek93aFkwWW1ZZk5ZWFBMYWh4d0hzR2duQnNvaFgyNDdHNTBpakpNVS9HL2Vu?=
 =?utf-8?B?MU80a3RIU2hmcGJiNkxzSGJYQWlZOE95SHlUVTlKR3RIejJMdVpscjhRYXFQ?=
 =?utf-8?B?ZGdUNVkyNytTRW5Va2xJbmZqWDFkRzZJcmtzWWxXZkdzaEMwUU9MVVgxTEgv?=
 =?utf-8?B?UHhmQlNTMkhaajhOcndMSnhTVmNWQXdtVWREVmtodDEyTVpodDE5Z0dYdjdR?=
 =?utf-8?B?UVMwM2dGbER5YWJUWHcyQXJ4MWxMWXdTeThaV2R3ajdwSEFUZzZ1ODU5YTdY?=
 =?utf-8?B?OGVEdHpENnFpVUkyb2dSekNDVVFrempzZHdYaFdVNVM3UFZ2N096a1dONzEw?=
 =?utf-8?B?T0hIRDAzejVOQXFrd2RkVlFYaURqQTBaRDB3VktCS1F6c0R0NnVFQUVaU3ZL?=
 =?utf-8?B?YjJRWjMrelFBTUFKMUVDWU5nUndLdmFIaDEwTXRLeVB1ZXZOVXdrZ0tLUm9T?=
 =?utf-8?B?M0I1UGhiWTZZaVlwWnk4OG1IV0JlR2Rpejd3ZXVmVFJGeW5ReVEvM2xYTjJ6?=
 =?utf-8?B?QlgrbTNiTTFlZG8zOUF1TkVIWlAwMmpFRnJuSDFwM041NkVJUHlPWVYvdlFP?=
 =?utf-8?B?NnRudzQyTzc1ODcyb1J2OG1XRFRjTUt4KzkvbEJ5ekd4YkU2VStqWlhBYk5r?=
 =?utf-8?B?RU1ieXMyblV2WnFheTV3Nkhrc0JPSWVHbHo1ellMNTNOT2hiY1RxNEpFK2Y3?=
 =?utf-8?B?a25OSkM3Smc1aFVqMzg2NnFJN3lkMlZFTStuZGNhUkg0d252MTM2c0lEdUtR?=
 =?utf-8?B?UVljSVRxYnVZeHFGTXlSWWxhcnRORzVVNXRjRmxjV0plVllyM3BQU2Z0Z2NW?=
 =?utf-8?B?VTFXazZEY0xJdEJWeEthYTJra1BlZ3hUVkFQMGFNUThMM08vK1NnRVlYT0JD?=
 =?utf-8?B?TVh2WVVZR284N0Vtcm8zM0tOMXJpVHBPeWFxUUdsaGJCV1Qwa1QrSERMRkxp?=
 =?utf-8?B?dTJ0ZXJsRFJNNTl2N0hGL3BXdzdnVDAxUEJsTlhTRzFSdlp1RURxZld3cmNx?=
 =?utf-8?B?RHp4UFpnTWJvSXBVSkJEVlo1ckdZNWxTVjkxdjJ1T0xOdmFmZEMrU2ptMm9a?=
 =?utf-8?B?QWxXdzdmS2tHSzYveFZoTXVEY0lmaEJpMlhySkcxS2JRRnJEd0N0bTZRb1R4?=
 =?utf-8?B?Skk2cWFDaE05RGZYYnJMVkpNczJWNnBSZjlDcUxWajFTS1VTSk9lckJoRGt2?=
 =?utf-8?B?NXkvSGwxMXJNZk95VVR1N2NxMTFIcUM2ZnpMK05yYS9XZThvZnkySUtCNzln?=
 =?utf-8?B?NldhemhQKzVlWVVBSm81MjBWdjYwcFQrSzhNdFlLalV2dm5CM3g4dHQ3cC84?=
 =?utf-8?B?UnBiSHNjL1lPeWhGcFRQME5yaVdLbXVJbHZkWThHaUZUQjF2UjZjQ0JLK2Iz?=
 =?utf-8?B?bXJSRjkwVHk1NFp2UWVtMFQwTUZoS3h5VWI3TUJMNUdFWEhWQ21Bbmtnbmxi?=
 =?utf-8?B?bmF3aXk0YklMbUZFNXltaXlOZDlSamlUbXdVR1FjQnlkSnBZTHMyN0ZVdEJw?=
 =?utf-8?B?ckE2bVU4cEhEZUEyalR0NnpzZDFreGo5WnhDSk9ndGtKVTdUbUZ4Y0t4cjZQ?=
 =?utf-8?B?bHJkeVpidUNxMUR0Z1p0VkN4ZGpDSU1ua29LdUJ0d3ZLQ2hKTXptanlVZkZU?=
 =?utf-8?B?NWZwZjBKZ0FjUTZMZ2tRTFNsVmxxc0VkeFFSdGwyNnFDVlRFQ1FXVytaOWVQ?=
 =?utf-8?B?OTBaYy9rcjVFcURxSDc4OUxpK2FtZ1A5VzhxZXAzdFZlZHROM0hZWCtoSTRW?=
 =?utf-8?B?Y0FiNUhJeGNFSFU3NDJoT2ZKK1hKNnd4VEpYb051WWtIYlRhR3IycnB2S01E?=
 =?utf-8?B?QVAyV3pIYkxiYXo2K2xXY0dGa3pUMGFTL1J6eHFrNjUxRzIzWCtjcXhGUlFp?=
 =?utf-8?B?SlgrR25JWVZaMXJHMHNlRmZ1RmxKbWN1c1U1ZWtvWkd2ZkpGYjJxMTJ5YjBQ?=
 =?utf-8?B?TFMwWGtlQ2pRT3RlTXVaTW5BRXhBS0YwM1loVUFXc1RMZWw0Qzg2bUxJd04z?=
 =?utf-8?B?eGYvT2ZnWlRJYmlpQ2wvZlpiV1hUb0Yxai9admFKR3JQUWJUZUhlOHlyd1Y2?=
 =?utf-8?Q?a3WXGOnDcaoY2gZ7WT8fu3s=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9d8853-58a4-4201-92f3-08dcef528a51
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 08:54:56.8178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJBl/8rU35UZqefie+fBOlvak/BoIyejHnAfq1jgGcBeTDsBPD5Q9MM2FUmhJ308eFP9dwuRfRmHXwq/xjZsK0wmWe7wPR20B/k11ojhGyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9982

On 10/16/2024 7:08 PM, Alexandre Belloni wrote:

Hello Rob and Alexandre,

Thank you for your careful review!

> On 15/10/2024 16:27:17-0500, Rob Herring wrote:
>> On Tue, Oct 15, 2024 at 04:15:40PM -0500, Rob Herring wrote:
>>> On Tue, Oct 15, 2024 at 01:51:30PM +0300, Ciprian Costea wrote:
>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>
>>>> This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
>>>>
>>>> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
>>>> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
>>>> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>> ---
>>>>   .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 102 ++++++++++++++++++
>>>>   1 file changed, 102 insertions(+)
>>>>   create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>>> new file mode 100644
>>>> index 000000000000..3a77d4dd8f3d
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>>> @@ -0,0 +1,102 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: NXP S32G2/S32G3 Real Time Clock (RTC)
>>>> +
>>>> +maintainers:
>>>> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>>>> +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - enum:
>>>> +          - nxp,s32g2-rtc
>>>> +      - items:
>>>> +          - const: nxp,s32g3-rtc
>>>> +          - const: nxp,s32g2-rtc
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#clock-cells":
>>>> +    const: 1
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: ipg clock drives the access to the
>>>> +          RTC iomapped registers
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: ipg
>>>> +
>>>> +  assigned-clocks:
>>>> +    minItems: 1
>>>> +    items:
>>>> +      - description: Runtime clock source. It must be a clock
>>>> +            source for the RTC module. It will be disabled by hardware
>>>> +            during Standby/Suspend.
>>>> +      - description: Standby/Suspend clock source. It is optional
>>>> +            and can be used in case the RTC will continue ticking during
>>>> +            platform/system suspend. RTC hardware module contains a
>>>> +            hardware mux for clock source selection.
>>>
>>> If the RTC h/w contains a mux, then your mux inputs should be listed in
>>> 'clocks', not here.
>>>
>>>> +
>>>> +  assigned-clock-parents:
>>>> +    description: List of phandles to each parent clock.
>>>> +
>>>> +  assigned-clock-rates:
>>>> +    description: List of frequencies for RTC clock sources.
>>>> +            RTC module contains 2 hardware divisors which can be
>>>> +            enabled or not. Hence, available frequencies are the following
>>>> +            parent_freq, parent_freq / 512, parent_freq / 32 or
>>>> +            parent_freq / (512 * 32)
>>>
>>> In general, assigned-clocks* do not need to be documented and should
>>> never be required.
>>>
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>> +  - "#clock-cells"
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - assigned-clocks
>>>> +  - assigned-clock-parents
>>>> +  - assigned-clock-rates
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>> +
>>>> +    rtc0: rtc@40060000 {
>>>> +        compatible = "nxp,s32g3-rtc",
>>>> +                   "nxp,s32g2-rtc";
>>>> +        reg = <0x40060000 0x1000>;
>>>> +        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
>>>> +        #clock-cells = <1>;
>>>> +        clocks = <&clks 54>;
>>>> +        clock-names = "ipg";
>>>> +        /*
>>>> +         * Configuration of default parent clocks.
>>>> +         * 'assigned-clocks' 0-3 IDs are Runtime clock sources
>>>> +         * 4-7 IDs are Suspend/Standby clock sources.
>>>> +         */
>>>> +        assigned-clocks = <&rtc0 2>, <&rtc0 4>;
>>>
>>> That's weird...
>>>
>>>> +        assigned-clock-parents = <&clks 56>, <&clks 55>;
>>>
>>> I'd expect these should be in 'clocks'. I don't think this node should
>>> be a clock provider unless it provides a clock to something outside the
>>> RTC.
>>>
>>> Looks like you are just using assigned-clocks to configure the clock mux
>>> in the RTC. That's way over complicated. Just define a vendor specific
>>> property with the mux settings.
>>
>> I just read v1 and got told use the clock framework...
>>
>> I disagree completely. Tons of h/w blocks have the ability to select
>> (internal to the block) from multiple clock sources. Making the block a
>> clock provider to itself is completely pointless and an overkill, and
>> we *never* do that. Any display controller or audio interface has
>> mutiple clock sources as just 2 examples.
> 
> And in 6 months, we are going to learn that the rtc is used to clock the
> wifi chip or whatever and we are going to need to add everything in the
> CCF and we will have an unused property that we are going to have to
> support forever to avoid breaking the ABI. This already happened...
> 
>>
>> However, I don't see why you need the divider config in DT. Can't you
>> figure out what divider you need based on input frequency? The output
>> frequency should be fixed, right?
>>
>> Rob
> 

Would the following approach be acceptable ?

1. Keep 'assigned-clocks' based implementation as optional (not 
required), in order to take leverage of its scalability for allowing 
different clock source and divisor settings.
2. Implement a default clock muxing setting in the driver for both 
Runtime and Suspend.


Best Regards,
Ciprian


