Return-Path: <linux-rtc+bounces-6307-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GflEXGJ12kPPggAu9opvQ
	(envelope-from <linux-rtc+bounces-6307-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Apr 2026 13:11:45 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E043C98AA
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Apr 2026 13:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3F77300CC0F
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Apr 2026 11:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886C3379EFC;
	Thu,  9 Apr 2026 11:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="URgI3SUZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013052.outbound.protection.outlook.com [40.107.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B67369990
	for <linux-rtc@vger.kernel.org>; Thu,  9 Apr 2026 11:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733091; cv=fail; b=j0DrnSdkqoLBoumZPXVmDOIgo3FDxUeX8A1YEUh4Ktl9P2R0gvPvGBwDTzlOmshFDFXYqoBpaV55HY869Pq1uN5blsjobywkIVGb/mHzeaEtpNmixx773xgqfMt3fW1BzZdAh7co6rNVDmRJuw/ajKbyIK0pdL7AocaOFnJCwl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733091; c=relaxed/simple;
	bh=EYCFabv+40W92Q36uUITOZhdr0epoZ17unSrMkxwWMA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fhsiRfvEqZMGBpiaexegYJHv6EBt+SoMS/IaWfDI701lM3Nu2iAhR1kZogw4plKgJTn5Ngrc2HWHIRSgeTk9HUdPDWPQBWafv2WRuyUHYMn49xKFF1bkaavPrbB7sEvv4RlCYyF5BXkxenZpCDNqP3e4eLRre2HeRWEANjpoWEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=URgI3SUZ; arc=fail smtp.client-ip=40.107.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnWJW8/xDl1KbYKTUg4cj8aoMJ5w8Tb5yGVqNGTnBCSX2jhfI4x15JhFRMTCFWWfki01COMPwkv8AtcTp3Gbp56sA5ixOmbzkyfKYdAKrLli+ANV5OvuuGt78AUTW85XbkEpVGoVuUmzVyfH3j0LiL9F/4HR80skNTAaXm6ffpkOrqBpGn2eGcrCknXS5CjM4e/yAI7iiX5xPS41+FlBPGpZNwYFy2erh3rgqayR4YiqrlRZqzVWVEPSn3nxgon1059z1m+4+CeJwFqHlj/tYmegSuACOVUofwjlm1ulKeUsRGH+d07qkNSAs69JYs34GbSYNMr4Sm9/d/JbUqNF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2Xjo8SlTmAJ3xeaptZMLcN6LrdgYqR8c13xF2TXWVY=;
 b=aTxli3PyF4w4JQAK2fnLKzx3/uFNNcDIroOCrcwU+W4frtZpv2VKVSWzGfysS0eDvK87QCGUPJnUHvMzjjlss4ZwaN4Q3Njc9beTVY/7QQdgx1Wo7Dif/EhgfUM1cVR++DPF1zFGzrE28CzfeRkk9BerGkZdgCHsXLY8Yivq2RKwTwTdzaTYAsP2HUURD+Y/N2g/YiD/w/U2S/90fiwxebWS8X5IMjJbGCRO2DWJ5Dtl5f/Jqsf7DnQzsTjX3SEybttEOf/Lb5h88BcksVYW9/m/3nWEMWkWoLRqyYt0OSxDhD6J3ktvmesZ8GWJqhguh0+BbTh2wr8vWagkbKY8XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2Xjo8SlTmAJ3xeaptZMLcN6LrdgYqR8c13xF2TXWVY=;
 b=URgI3SUZBxtCntLO893JybV4JlAztks6ZfN1QzlJDixz5VTf8kEDcSSH+O/PpS9Ql++PXBHWcwl2RHKNo7cwxwDWU2Br319DUsAxTSwAVdW8AvdK/C889oVmZ1F22CtgYgVN9eStp4dDic90AuNUKIhws51G72klGtGT/Rvo4eI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by PH7PR12MB7890.namprd12.prod.outlook.com (2603:10b6:510:268::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Thu, 9 Apr
 2026 11:11:23 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2%6]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 11:11:23 +0000
Message-ID: <6ea7ad01-3bf1-45b0-a06b-85e2b9c0f83b@amd.com>
Date: Thu, 9 Apr 2026 16:41:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] rtc: zynqmp: CALIB_RD reset behavior differs between
 ZynqMP and Versal
To: Takumi Ando <takumi@spacecubics.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tomas Melin <tomas.melin@vaisala.com>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>, Yasushi SHOJI
 <yashi@spacecubics.com>, kanta tamura <kanta@spacecubics.com>
References: <CAJACUaoFK-GiBN_hfkNajDUygnSZc29U_jdeQ_rKtXS7P1f-nw@mail.gmail.com>
 <9ed6823e-b381-4de5-b1cf-98f5dc54bb7c@vaisala.com>
 <202603061113298cbba29d@mail.local>
 <CAJACUaqHDJOZY-jgriGRX=DE=e3rvBgvycjO1exxQ7k1XdywpA@mail.gmail.com>
 <ac27be8f-363e-42e6-8b46-e95ab739762a@vaisala.com>
 <CAJACUapT3cNwQtyE1zmQcGfDex2jmrbvvd9vOvZhC3v8+h3cZQ@mail.gmail.com>
Content-Language: en-US
From: "T, Harini" <harini.t@amd.com>
In-Reply-To: <CAJACUapT3cNwQtyE1zmQcGfDex2jmrbvvd9vOvZhC3v8+h3cZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0137.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::17) To LV5PR12MB9804.namprd12.prod.outlook.com
 (2603:10b6:408:303::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9804:EE_|PH7PR12MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: b8692a55-9801-441d-1dd3-08de9628bbd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	F67ZaXy7CX1jL6P1b7/3+f4kdZv4X1GC7dTig2HgPb/WujNK3h5tCLu5+QOigbasIxbtZRfH6WC669H6YV+hv6S1037zIpZ79DxiYHO0YGUZAiF6y2UVM/Arn7AFp9wtRV8frORTOWZGM0C0YBe33nnyjIf7m4IWwU58aPphHK6qMkpQEJC1BLeauHDIYYhhOaaRVkfxfTgYkbQ9ym+79ew8YA0ypwO8vjLdhyyxS0f/m+V/NadGyxK1BGD6QABmoJOJxOZ5c2ECGcEl3J2vsei4vlTDwfSfC6XwhBiGubd1jGQkY3JvkCnSNoNOYzGG5LOZchh46h571v4Pd+XWa2sLRY3BxiBT2DVB6w6+s0apv7KkzqIU2fGedwJlqU67PsePp0ivU46BpWEAAq3/04dkRQVS3cKJzqWbGsdAetYc3jjku9UssJRL/Vt4ex23V1e+poPRfDYBeATrnd0sLKHCkny++JzlXuP4kw1KvzQH3GS+cUFaKXLkzd5BExThPs6UyIjVAUygsKoACLd1XIO6IF0HNx7Ut2CeVVaU3qYHxwnT4KYSnUJyIjPX6UqO04LqxY6VSW8WTUHtD3xz0fV4i90P+QoM7G2inedNHpu/VWLpsw2IXfyvNNJeqjDX2ee+ox++tzEMIbi1MseBNnRsLAA0Gyk5BWlyL7i3OXryLWHxULyXfEQ7O3lox1Vp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0tocU5EUkJabUFkZjArbUkyTEliYjFVVlhneDhLaGYrRW9rZG9IODkrK3VM?=
 =?utf-8?B?dDlKQlRmM0JSQXIwbUZWZzlqM2ZhQmFVM0tPZXdKTysrWmdnZEkzei80QU5o?=
 =?utf-8?B?WlliQXp6T21NcEVJak9oaDhOMy9LNVBFSjZ3NUJUV1lLZXZtTzFRR090cEVs?=
 =?utf-8?B?THVzbjYrOWx2SnZQYjFGQlI1eC9YZUJvcm9lQm1nVlN0MEFGQUJzV1p5L2hq?=
 =?utf-8?B?TFpCOXRwUThUdHFUcmxVd290ck1PbW9TTGNLNDNTRkx4S0JKQUJGejBpOTZX?=
 =?utf-8?B?QmZobk1nNVljOGhQY3BGYVN0Rk1xRlFXWmU4UWptQnJGekttYmswMWdZSGdS?=
 =?utf-8?B?aHpZbElZSnVXQWY1SmZmU3U4UElFNTdEMnhnTU1JQ2FUUTRiM3kxZlRDdjBZ?=
 =?utf-8?B?Z3lTSTlxSjJBNGtDVVI4L2JGYms0QXBJemNxeXRadGRyODdtWjhaS3NMSzc2?=
 =?utf-8?B?TlJkK3lwQWIveDhYVkpNRlB2TkN2SWFSaStYekorVjFMQ280ZlFrdVRDSWI0?=
 =?utf-8?B?M0o4ZFNJZCsvcy8rZWEwUjk1Rk4ySEhCRk1qcm1aaHdzZFVRTWpBa2gzU1Ir?=
 =?utf-8?B?eHppcnIrOTZRVHhiYS9hWVZCMmFxdmJpNkNYaHJyaEhaUi94QUtBa0xGMnl6?=
 =?utf-8?B?QUU0K3FUVWhGLzFlU0MrYzlya1JOZjIxZXcwakJSUUhLZkd3K1I0MG1WQms3?=
 =?utf-8?B?cS94OG9kTVI3VFRQd1lncEg1bmk3Y25sNTNETDgzOHR3NTd3MGZ1V3QwVkRh?=
 =?utf-8?B?Vm51YmUxeWdjTXZEK0pWUjQ4ZXFiU2xCSDJIRE9nK0s2Z2x2VUZiUW4rZmNa?=
 =?utf-8?B?cUN6emdSaU1qbHlmOWUxSjk2dFdZVnpsdkdjL0h4blp2aDhWU3VQWklrcWpp?=
 =?utf-8?B?cUl3NXN1d1lMNVVpM1BiNHhsNGEwZDl4RmVoeERKU05HR2w4dndVVWN3Y1FJ?=
 =?utf-8?B?Qlhaa05KaEdpUGFzY1VaWGVTUlE2bXF2NFF1cmZ6eGEveEM4S2p6Rkx3b3A3?=
 =?utf-8?B?dWJ0UHp6NGNROEFBQlhmbDRITGV6K2owbWNGc1NqdkJEQVFnSVA4aWRXMUdD?=
 =?utf-8?B?alFIS0JmamtRMFVQOVRNR0VuTXBBTXpsNy83Y0QvdUpKS3ZwZlZrLzMyUSt6?=
 =?utf-8?B?Q3Q2aWx5b29kbHhMMmpFTFJEbmYwaitWbEVKM2lnd3l6SnFiV3cyTUtQQXAw?=
 =?utf-8?B?VUlXdHErQjVvMEwvaGN6VWR4dzViSkRqSmt3ZktmUERUaW1wSFNOMXlWUVB2?=
 =?utf-8?B?SlFCNzZBYzN0ak9ZSHVGMlpSKzBHUlRQNlUvTDRUdVJXV2dJM1VSVW5ZNWN2?=
 =?utf-8?B?M1J4dm1Id2V2NUpyM0xrYi9EM2pGREdjZ0ozdnRiOFNJd0lic25PNEJGYSti?=
 =?utf-8?B?WlFUL3Fpd3VkdDFTZkNkSmtvay9vMzBUcnJWOEJMODhkK0JiMDJlQ2VvUFRM?=
 =?utf-8?B?ZVVEUUN0bDhCSFpqVFVaRHorTUFaSWRVSkc3U1VFNHhIT0Y0Qk1kcGZ3OW8v?=
 =?utf-8?B?aDRidG9IcThQMnNEUzM5R2drNUc5NlFNMGc1UDBpVjdONTArdFhmenRGTmR2?=
 =?utf-8?B?aEdVeGJZd3Nhamc1b2pYNkU3NStHc0U2dG9UbXRBbS9XWDZTcVpNaFRCWFZC?=
 =?utf-8?B?VnZvZ3Y1MHZxUHR0RkdaNXhDSG96cDVqVk9sZ05BUWFDSFhDQ29OSUhSbk5m?=
 =?utf-8?B?U20vVmduQkoyN2xZcUFIbmo4NXZMV3FOSDFaemhzRjh2Z3Q4QVJpMHF4bWVB?=
 =?utf-8?B?THZoZnpkVXBXbllaNUlJSUt0bHhHandSM09HRWh3MEd1YVlUcEYvUFVsSG44?=
 =?utf-8?B?aytKRFJoL3BqemJackFwdnFOZmVCOUFjaHpIdVNpWkRxWFVwYk5GQzNBU2ZB?=
 =?utf-8?B?Ykh5NHovbUJIMUJXcTRTbWdrVkNObU84eGJiYUUzQzh0NDVLYWtsdlN2dTRw?=
 =?utf-8?B?NzBuU0twSHNBbjZjT3BBTVJMRXlSSWdVdURuN2pJMVBYNGhwTnhxbUUzUlV2?=
 =?utf-8?B?Z0VkVExLblRmL3daZmZjakJmY3FZOHJsclZQWFpWbjJ0RCttZWE1L1gvT25q?=
 =?utf-8?B?ckJtOGF2dC8wVWl0emNjdEpDcGcvTHFIV3ZHeGN3V0hZQ3dLL3Y5UmlJazRU?=
 =?utf-8?B?cDZwcXAxcmNtVkVEdVc3TnNGS0FCSTFnYzZLUTB6Z2JtdWwwNlM4UGNFeTBV?=
 =?utf-8?B?N0lyOVdyYVduRFRZa1lqSjlZMDZkYUZTUEhQVnhmeTZhRzBMTUFmSEFYem05?=
 =?utf-8?B?UklINm1CV0piYmUySTN4aklrQjRKeTNtSHRWZTdRbldKNUdKZUwzeHRxTjJ3?=
 =?utf-8?Q?V5FKiPs6IdFmm9CB/0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8692a55-9801-441d-1dd3-08de9628bbd0
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:11:23.0326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +aVrgXQkx+CHgPpMekOWventPhLIJkhYRc0yl53NykGvzTNtZofexqPLwIlHaPqG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7890
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6307-lists,linux-rtc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harini.t@amd.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,spacecubics.com:email,vaisala.com:email,aka.ms:url]
X-Rspamd-Queue-Id: 98E043C98AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 3/11/2026 12:22 PM, Takumi Ando wrote:
> [You don't often get email from takumi@spacecubics.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Tomas,
> 
> Thanks for the clarification.
> 
> My understanding is that the fractional correction (fract_data) should
> indeed be managed from userspace since it represents oscillator drift
> and may change over time.
> 
> However, the Max_Tick field seems to have a different role: it defines
> the number of RTC oscillator cycles corresponding to one second.
> For example, with a 32.768 kHz oscillator the value should be 32768-1.
> 
> This is how I interpreted the documentation as well.
> In the AM012, the description of Max_Tick says that the
> register value multiplied by the oscillator period should equal one
> second, and it explicitly states that for a 32.768 kHz oscillator the
> value will be 0x7FFF.
> 
> Because of this, it appears that Max_Tick depends only on the oscillator
> frequency and should not change dynamically like the fractional
> correction.
> 
> Did I misunderstand the purpose of the Max_Tick field?

Your understanding of the Max_Tick field is correct. However, in the 
driver's set_offset() implementation, the ppb offset is decomposed into 
a whole-tick adjustment (which modifies the Max_Tick) and a 
fractional-tick adjustment (fract_data).
Both fields are written together to the calibration register in a single 
operation. This is what Tomas was referring to when he said both may change.

Since the crystal is never exactly 32.678 kHz and its frequency varies 
with temperature and aging, userspace must always compute and apply 
correct offset. When it does so via /sys/class/rtc/rtcX/offset, the 
entire calibration register including Max_Tick is programmed to the 
appropriate value.

Additionally writing Max_Tick unconditionally during probe would destroy 
a valid calibration value that may have been preserved across a warm 
reboot on a battery-backed RTC.

Thanks,
Harini T

> 
> Best regards,
> 
> 2026年3月11日(水) 14:23 Tomas Melin <tomas.melin@vaisala.com>:
>>
>> Hi,
>>
>> On 11/03/2026 05:19, Takumi Ando wrote:
>>> [You don't often get email from takumi@spacecubics.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Hi Tomas, Alexandre,
>>>
>>> Thank you for the explanations.
>>>
>>> So if I understand correctly, both on Zynq UltraScale+ and Versal,
>>> CALIB_RD may return a non-zero (or otherwise undefined) value after
>>> reset, meaning that it cannot reliably be used to determine whether
>>> the calibration register has already been initialized.
>>>
>>> While the fractional calibration should indeed be handled from
>>> userspace (e.g. via the RTC offset interface), it seems that the
>>> Max_Tick field should still always be programmed according to the
>>> value provided in Device Tree, since it depends only on the RTC
>>> oscillator frequency.
>>
>> Both max_tick and fract_data might change, it depends on how big
>>
>> the calibrator drift/offset is and if it is negative/positive.
>>
>>>
>>> Would it make sense for the driver to always program Max_Tick from the
>>> Device Tree "calibration" property while preserving the fractional
>>> calibration bits currently stored in hardware?
>>
>> As Alexandre mentioned, user space needs to ensure calibration is what
>> it should be.
>>
>>
>> thanks,
>>
>> Tomas
>>
>>
>>>
>>> If this approach sounds reasonable, I would like to prepare a patch
>>> for upstream.
>>>
>>> Best regards,
>>>
>>> 2026年3月6日(金) 20:13 Alexandre Belloni <alexandre.belloni@bootlin.com>:
>>>> On 06/03/2026 12:09:40+0200, Tomas Melin wrote:
>>>>>> On Zynq UltraScale+ Devices Register Reference (UG1087) [2],
>>>>>> CALIB_RD resets to 0, so the current logic works correctly there.
>>>>>> However, this assumption does not appear to hold for Versal.
>>>>> For Ultrascale+ the calibration register also gives random values after
>>>>> reset, perhaps you have noticed this:
>>>>> https://adaptivesupport.amd.com/s/article/000036886?language=en_US. Maybe
>>>>> the same can occur also on Versal.
>>>>>
>>>>> AFAIK there is no way of knowing if the value is correct or not after reset,
>>>>> so user space helpers might be needed to maintain the calibration value at a
>>>>> desired value.
>>>>>
>>>> Userspace is always needed to put the proper calibration, there is no
>>>> way for the kernel to know what value to put there. In the support case
>>>> above, the crystal will never be exactly 32768Hz and this value will
>>>> change over time and also depends on the temperature. The value always
>>>> needs to be computed, if your device can do NTP, chrony will provide the
>>>> proper offsets. If you don't have a way to measure the deviation, then
>>>> userspace can always forcefully set /sys/class/rtc/rtcX/offset if it
>>>> doesn't hold the correct value.
>>>> There is no need for devmem here.
>>>>
>>>> --
>>>> Alexandre Belloni, co-owner and COO, Bootlin
>>>> Embedded Linux and Kernel engineering
>>>> https://bootlin.com/
>>>
>>>
>>> --
>>> Takumi Ando
>>> Space Cubics Inc.
> 
> 
> 
> --
> Takumi Ando
> Space Cubics Inc.
> 


