Return-Path: <linux-rtc+bounces-6759-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lUegD69oPGoynwgAu9opvQ
	(envelope-from <linux-rtc+bounces-6759-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jun 2026 01:30:55 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C85B6C1E2C
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jun 2026 01:30:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=dSUQPfe3;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6759-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6759-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70FF0301B915
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0FF3B71B8;
	Wed, 24 Jun 2026 23:30:52 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010043.outbound.protection.outlook.com [52.101.201.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B30C3B14CF;
	Wed, 24 Jun 2026 23:30:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782343852; cv=fail; b=c65y0OohMupdRsfq8tJ0YVyvp7JlE+YKYt76ue6GRzk3pz/jO14anp+EMTkVn1e8XfR8aGpPgrOKt9u+6kyVirelbPycHXRpceQqhqp6rLhL5PFJD6GIJ1EeOAGoOthc9lHaAN+jkP3qutYk2LCjYkgcKqF/7pOJpTbnnMwqAJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782343852; c=relaxed/simple;
	bh=SnXb/zojKCY4I5mcd+uV6Z5727ZbctmALrHrGOPFiyA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FCMLdK4HRbH5HgcTFhDAI+3lKe2C+U9AHPtIrU7ldSsekWXSr6Al3c6LgT5v9QcAMActovKeeFn6PM7iq6EcIbsBRSkjM1ILLSklEGdB/LsifGwO1VQ7HWfqKbOn4Bn3Vy4anJeKeBZPBLnwUQYedTT4HPw5YXFMn5Q9oBIQe3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dSUQPfe3; arc=fail smtp.client-ip=52.101.201.43
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8TGS1EgFeV8SAS3Pj76obi/AKq0IhRz3APvniMinqRb2KbKaZy/RNjx1rbWWcXuduzmYWc73bBcxnGBKgk21zqFoEyqVSMmMNsVzJxe+QqtaH3lFsg6cOnW1uv+/DYVUvdn/KVjFOameXEkp/8G/YKI7tkTVaxgvH6eyokd3osFLdjSvx3pRMh7+8wFM5qU2yReTz2Ham+68NWTGBwfHoxUsX6x1Q1bY90z3LqYdjlLQI7TTcGkaKjP5sNF6rWJNnBLhuKg2JLGxnGaTDacaLE6Z8bcrrozrU/agGFetHLHuxM8h+EMfk04JxmNVnY1/RDarcazmRdzbvJSUsaiQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+76DoXBbuYpF86fSuDZ/BykiX0ZNwiKDgbqp7s4o31g=;
 b=dhEi45yHh8l29BjLzDkjyjMHjuMEdOx4iWNU3z4lygBt26o8AV6Ult6ulqOPUi7yMOb1MfKBZCC53AXQeahrf/RvIUyhnsSptkxdyNjrk3OIIVAnsVDepS8T/r7L1+i3RYuq8tEf+QTMdnar4+yGVeg6tCsfUHJ7NfOOjyuuGna7mXEZZ6atIVmMtBDt2WS+MsPm+fhyytXM0Lawg70pRCTqW8+jkUkuC0zk6wps8PovVq8HUR7SxH+M4CgvcDg+Yk0XTQPn1TCV8AMXr4jcmV50bxuUAVKSiRK8xNdOmNrtklSKS/90i+cXs6qTvXPvTs+dzdt27Z5kk8hfLLb3Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+76DoXBbuYpF86fSuDZ/BykiX0ZNwiKDgbqp7s4o31g=;
 b=dSUQPfe33x7tZ2aadEiTYnifeNQlrNtoWm2o221PqwCo9XZTXiDoeUboMJVZSY2W7LYNzq+OSAguNL9PbjJFtiwgih7zCEYJBSBb8oRsdhke31witFkGzI2QWsaqhI69oyI+vU3VaXmKFCwDPwbbahYuZNGzKg6B16guqK3p24E=
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by CY8PR12MB8337.namprd12.prod.outlook.com (2603:10b6:930:7d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 23:30:42 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 23:30:42 +0000
Message-ID: <9415b405-ec6c-425b-8abb-42964f5a2b3a@amd.com>
Date: Wed, 24 Jun 2026 16:30:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v2 1/2] rtc: Add rtc_read_next_alarm() to read
 next expiring timer
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20260521043714.1022930-2-mario.limonciello@amd.com>
 <178233558814.1517260.7453046865036017375.b4-ty@b4>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <178233558814.1517260.7453046865036017375.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0109.namprd05.prod.outlook.com
 (2603:10b6:a03:334::24) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|CY8PR12MB8337:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aea15fa-4e20-43e4-4e21-08ded2489bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	+gwKitvjZLFwS6yVLXuQDmc+5CRtmNN2DSQIORMqKM1LW9L0QFbBd20tgFUbj4BwYejTqOEh8aSsR+FZiYqJmf+XWT3s1SzpcQRMSzW5pJwcuUZjKVXcnLEHwNFVKk64fvCviVzced564h5T5O17Yur+KddBqCKamCeuiy30oL24nG5GVG1GYuFZgSgXfWGXyVovMZCeMncrxfx3b9VHDdxtUGM+I4CZ+6rgS20ZGym10UaKFMMpQzDpmtfJzVv1hE5b6v6z9BW2rLriJMbyxDdePUHBXGNugGxS6yDiaW6au4AE5arWrW5MMOIn/pXhC/L/voFfdK2m1CW3OQwaK+rPsnIqFdv8DSERTXQNqMBEUujL8z5EkOl03MEzs9IH2r1hU2y760OlccNhfrYtQYgW1AcNxtj5c1EapuIehA5Yu16qPSnshgailGFqpUQO2ZbxWaPfGZuEOe3anGN1lojI1QAoGCJUW8sJN8uBFBi8LByukU5SUdjQQz4ojPuGDb15hVJcMbvZn4WFwdlTvM0NnDt+dAwpw2jvfXA+Vs1BnJo70c/jXSTxTZuH9evxmKKRrLKxY5NlgFKAppEJMnU+AR0QIYZEkNOuxUWYQLpb1Q5gNN7Dr4AeeY+XVnt16/0HvLAQnb7gPa19mrVae7hopKJDjvmLqR8XuwpJJk8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFMxSkhhU0xOVHBxRmdOWVdvc1pwVE5SNDRiSndSSEhyYWVTSUhZTFVPUFQv?=
 =?utf-8?B?aTQ0QzFOemFpSU1Ta2pzMlFxZFdjQXVvRCtNZGg5cDZsM2RIMGRqOXFXZG1K?=
 =?utf-8?B?QUZxN3dKclJTVllxMWUxSHBWMnk2eHBldVNGckdyUWJWZWpyZTRvWHJzSERB?=
 =?utf-8?B?TmJDbkxSMkVYVjZyb0FIWHQ4UGR0MHN1c2dFdHVTTWk0UXpqK09XMlk0VVpZ?=
 =?utf-8?B?SG1lN2w1YzVvcHhKN2plYU5UU3g1WlRucElUR1BUUHB4VzBqVFBTZTFEcWpm?=
 =?utf-8?B?ZC94OE5QNE02SEsvTi9YcjJIWHBJdW9Lbit5cUhkYWlLY1U4TTdHK2N5YXpO?=
 =?utf-8?B?S2dLY3lTbmVNbTVxYmpNdjRORjB6dEwwMGVSR0o3THZKMTBWTjc3RWFYT1U4?=
 =?utf-8?B?WUdwYmwxNGdXYlhSOGpKdzZ3M1VmcjZ3QTZ4ZkFJRGlQZXNIY05ieEFoZHRZ?=
 =?utf-8?B?dHYrRGFVZlB5eUdVZm9ha0xnaVFPTE5McUloZVVBZjFSdERUbktKc0RoSlJw?=
 =?utf-8?B?T2RZSGJTbm13cjNYbEVGRGFKQlhYWGhTKzlRMDNMbDNCUWJ2bmovNFpsL3hF?=
 =?utf-8?B?OUtCQzRFNm95ZGJCb2JQQ0tjL1BuOGRFZW5MTFdORHI5R2ZyTkRMWnFRMWlh?=
 =?utf-8?B?bDcvK2laM0NaVzlCWFZtK282eGZLcVhRbzFRK2JxQW03VDZ0MUIxenpiUVFz?=
 =?utf-8?B?WS91Z1lDUzZuWWtwYi9nWWdPLzFnL29IUFRhdWwxN2U3YXBjOWpWZ0ZqaTNo?=
 =?utf-8?B?a3BXKzhSUzZaa3BjTVU2QWVEN2tpSmo0eWdPdjExaCsxbzJib3pLSjQxUTAw?=
 =?utf-8?B?WWQxOStGSXNkRDUwSUxMRjBxZklnMk0vYkRpcmtzaDFnanY2QjBxRDRCWSts?=
 =?utf-8?B?QW5mM0MyYjRVOG5VejliL0prL2FvY1lyK0RtLzNyOWZIcG1GSzQvU25iSDlB?=
 =?utf-8?B?MUFLWkkwaHh4dnZ3dHQ5VEZBUmd3OXlDYjRaK1dxTlRZcm91cUNTTzBBaENR?=
 =?utf-8?B?ZU1wTXZBWjFjbG1EOTJtSkV3NlJHRmdacFRyU3hxT3BwOVVTWTNySVd6OStK?=
 =?utf-8?B?T280WEc3N0c5QjROVnFmMUwzeHhIOGxSengxWU1zd1VwTTh5eDFOSEpsTDlG?=
 =?utf-8?B?R2lpWDhwTTRjMmFxM1R6VWVGVS9HaGExTDR2dDA5TDhPN2NuT3RLODNxK1c2?=
 =?utf-8?B?RUlUQU9FeStQeHZhaDl5eHRzWktsTDk4NVlaeURoeEd5blRIOVVidTNZMndx?=
 =?utf-8?B?bnRibkRmNm5GdlkzVlpWTW94OUtsaTllTEt5eHpCVGcvUUdINFJZN2t2RnM1?=
 =?utf-8?B?N2E5d0FldEU0aVVwajFUeER2a3JLYzc0c0JwZHU2dVBETGRYNXRRekNKOFBS?=
 =?utf-8?B?cExleVNRUDFVVjNySjZtdTJqNldRaGdENU9ONFR3RnAydng4dFZBeUhoMG9y?=
 =?utf-8?B?UENpTG5rUTF3RG9zdFZ1VG04QUl6QWlyeUNmRmUrTGJqVFlldnJEYVlIWCtT?=
 =?utf-8?B?TVZ4aUQ1MktOTk5FM3d0Ui9ISk84ZW80V01CZCtpdlZrclFUUnFidktkWGQy?=
 =?utf-8?B?VC9GMG1meVIyeGJ6RDZUMmFUb2lLSUQ4amdTQ0JSRjdiN2pOR1FqK2tEN29H?=
 =?utf-8?B?bmhjWjQ2SmdPVjBqM3RDdUpEcEplaEdrSFJkd0NJOG9kTnhTQWxGSnBqdU8r?=
 =?utf-8?B?NGs1TWY5U2pDb0RVSHdPclY4WW9BUGZHUnZLa3l1OGw2c05YTFNqVmRLTTVy?=
 =?utf-8?B?M3FWbXZuL0RLRDBVdXdGV245LzNiZWVFdi9jb25kSW80M1cyT2Jtc0xNMkY2?=
 =?utf-8?B?Q1d6dVpLMk9YL0pKWmpRSHhqTmlCakQ1QkQ5SUIvSnV6dWluOEFRbEc4ODBN?=
 =?utf-8?B?dDNUVk4zUWN2bW5VRUpQbHlieGUxRUltK3dDaHFYRENKZlJ1dkE5WTdYaU4v?=
 =?utf-8?B?MmVRSmtwWlZZdjhCMU15TXZ1QmdkQnJwcmN6UW1ieUsxekRMNFNFV290cGtS?=
 =?utf-8?B?MGZMejk2dXRid2pNSDFKT0pDOUpVbE9QL0t1QWJ5SXlYbTNIbHRUZTMzcndT?=
 =?utf-8?B?U2E0SFYxOVpmQzVrbnZwbFF1OUdDVnlXMy9YdGxLWEZVM3A1Qm1YWWprWlEv?=
 =?utf-8?B?dXlSUEVBY2k5a0tPMUR3WTlweDFsdlVBVnJTSWQzVzIvTWhXcDB5aE1MS054?=
 =?utf-8?B?S3JRYnJacEpnaUJlSWwvbHc3ZC81TE10MjF3cFArbXFFV3FLU1h4VWxEVjln?=
 =?utf-8?B?YlhPeXpONTFYem9QRUt4YUJzUDVvaDRiUWt5SkNTanJwUHFldVVUM2tNYnl6?=
 =?utf-8?Q?ePC8MPSE4vKsoApaEt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aea15fa-4e20-43e4-4e21-08ded2489bbd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 23:30:42.7075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2Zvxi2ksVplbKbre4I4wap0dFsM+aJbz3Y7WWELvYeJ8izLrg4yjgnvTPHhd5oKRckpngYuJeiqgTFYkRp9bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8337
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6759-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Shyam-sundar.S-k@amd.com,m:ilpo.jarvinen@linux.intel.com,m:hansg@kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:tglx@kernel.org,m:alexandre.belloni@bootlin.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,amd.com:dkim,amd.com:mid,amd.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C85B6C1E2C



On 6/24/26 14:15, Alexandre Belloni wrote:
> On Wed, 20 May 2026 23:37:13 -0500, Mario Limonciello wrote:
>> Add a new function rtc_read_next_alarm() that reads the next expiring
>> alarm from the RTC timerqueue. This is different from rtc_read_alarm(),
>> which only reads the aie_timer.
>>
>> The wakealarm sysfs file programs the rtc->aie_timer, whereas the
>> alarmtimer suspend routine programs its own timer into the RTC timerqueue.
>> Both timers end up in the RTC's timerqueue, and the first expiring timer
>> is what gets armed in the hardware.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/2] rtc: Add rtc_read_next_alarm() to read next expiring timer
>        https://git.kernel.org/abelloni/c/947d7ea6f60b
> 
> Best regards,
> 

Thanks!

Ilpo, Shyam,

How do you want to handle patch 2/2?  Immutable branch and come through 
pdx86?  Or would you rather it go through Alexandre's tree?

Thanks,

