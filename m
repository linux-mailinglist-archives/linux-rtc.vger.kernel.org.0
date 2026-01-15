Return-Path: <linux-rtc+bounces-5760-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DA050D22CC9
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Jan 2026 08:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CA97301FD2A
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Jan 2026 07:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C622236EB;
	Thu, 15 Jan 2026 07:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="mehQZz+6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023115.outbound.protection.outlook.com [52.101.72.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C1618EFD1;
	Thu, 15 Jan 2026 07:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461893; cv=fail; b=uHUbzmeeCARJL652cVWSjo26EYQYDeTrpgPAykPq+7e6Pybnjr72MDN3B5t0FT2hfjzm3nh/duZ+4yvsk97Pd7dEFjnZvqvXrz3FJm9VmPzEu+KGho5kqCtQXwAixyVNeDEdcpHCLeGyJSMcVEpHma+c2SLdpRFO75qpKtdplbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461893; c=relaxed/simple;
	bh=34iGxawtjZFf8RwqWtk9Q3jPTQiIieC5G0CXE9IMJ44=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i7biXh4bJjT8VcAcq8m9mv35AyqIVmfEnmEmHyUL9MVaK6avc8I11kbw/qBHy2YK1KzeEj84RCoHvv1sk4+236voIg0yAaYpcYtWa4gNNhHi1PYb11Mo0w5Dj37172/AoMk/0T72OKzbqVklg+GYlmzrY7u6/xChsx4wGikiWos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=mehQZz+6; arc=fail smtp.client-ip=52.101.72.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQmLxwicfgDGv3AZR3aBqpfdTHGtb430M1Cd7L582dibRoMWa9l3C2JrnveK1racmj8q2PH4QmNhlzd3U0d0lGKRhX8YUBBM1q9KhkyX77T3hmdhq22UlUs19htSK3p2Sx8PdflrXxxMl3OKaWxkbAETUCuFKdzFXNgeJAMZtBOxFUpYcpKPLPjO8XRZkj7er5WSa2wU5ML8X3USEFFm2w2JlNB58sJJqXAsLv12WHCdPKscHR0uS3TKGk7cVuZuWUMEFknOwfXA8rW6bda6KIadnk+vh5MKQ6BR4vdMNsrZlS5xDixoLAdBEpRuoMvOrvV39r7hn4XbRNT/3PkKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZclElnz0dkPE7sqKHJwx5F3TY5EZQ5S7mQqBB4VdsBI=;
 b=dJs1uW/fy4XogA4wNesa1HFQR0JtMc6lGPOga/LrGcXPKvBTgRilFriETuEevgvET+DNhCOfLiWsw1etHyZDTOytfBtdDDDKLOMPU2GGw2yJgbbb6kcZERopOlE6ssCNwb+lUsJP47U66FVuehNUelJKnm3qA7wI8dKLq71VhGw57PgSLkd/5QLdP5oaku2Mv9zTCJhEPcTGVjCh0ywX+HkHnXA+813+XfgWkS8La9ByFrC7t5zk8wQLo3l1Ko62jdi7O4JObElSrKyn/VhW8aRNRj9Ys/s0VM+fsa1Fm2Z+cbsklbMwiVjVwOFUiwgxL1wKlSxcvrIL/uRY2Gdvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZclElnz0dkPE7sqKHJwx5F3TY5EZQ5S7mQqBB4VdsBI=;
 b=mehQZz+6qIDI4y3uGyo237JjV4FJs7JiEKVHxpGP1iXqT+c3OC1eF5Va+P2O1wvKbh1vSKtcmxuQaNFEHhRbiHCkJ0CMHVqJVT68FYnbW00Y5CLEtgFFJBJ8/upnOff1YUEAbFsD/V3Y/s+ApBxzNPLnBUVQLZRz55xVB7OD/CI1YsN0q9ZYN/PpspfOnqkHI+4ylNi1vhea9JE31jbnYTE/uSoCasBsAFIdHa23CzQmGIXoYR+fheC8Zo6B1puD9mODs2zMmue4/jZQ8FvsZ02EvvR8XSxYqsz6ncX6He5BUuzY7rV+RKWk4sct2E8HLY8E1GYNQjaDIcdH2Q0LZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by PAWPR06MB8787.eurprd06.prod.outlook.com (2603:10a6:102:38b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 07:24:41 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 07:24:41 +0000
Message-ID: <cb827883-1d3c-4d9f-8523-c2186c1c0a2b@vaisala.com>
Date: Thu, 15 Jan 2026 09:24:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] rtc: zynqmp: rework set_offset
To: "T, Harini" <Harini.T@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Simek, Michal" <michal.simek@amd.com>
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
 <20260108-zynqmp-rtc-updates-v2-4-864c161fa83d@vaisala.com>
 <LV5PR12MB980481A1DC737957538A9924928FA@LV5PR12MB9804.namprd12.prod.outlook.com>
Content-Language: en-US
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <LV5PR12MB980481A1DC737957538A9924928FA@LV5PR12MB9804.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVZP280CA0086.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:275::16) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|PAWPR06MB8787:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d79d06-0a84-46db-49be-08de54072647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czRsdjdrelVtTGhkOGJMVXhQTGQxV0xvaGFwU2tGRHNMa3VSNUZBQUxFcDVI?=
 =?utf-8?B?ejBHS1p0OTB2SHVBT1NoUml3QmpyWFd1MUVVSG5VMjZubC91SFdyUzBLVFU1?=
 =?utf-8?B?Z2dmZUlxQ0R3TU54bmo4bjJTQTU5dzNTQUJvTWY5V3pNWlVoRGY5WnFBL29F?=
 =?utf-8?B?SWVLV0ljYWFKSFlEazhtVWhpSGJSVTZXcnZ3bWVWeUlncVNQbllyMitQNk1o?=
 =?utf-8?B?czY4OVdXSjFrMFA0eXVhNWJJV0xqc04veFNwQ1JFVER0VkdQdDFVQkp0dC81?=
 =?utf-8?B?bXN1SE5PRXZtRVZWTDZCdGRKdkRyc1BsZTR5VGxkeDc5am5wRUZwS1NHTUR1?=
 =?utf-8?B?bzFwaHdxUTVWUXJvVDZIdTNhTHdlWkVoV2IrclY5TytxcHRYN0tLeTF1YzFO?=
 =?utf-8?B?TUMySEE5dHV0ZkhpWXZnTjgzYndzSXh1RzYwZW1pV0dxekdiVHNiK0xkdC9i?=
 =?utf-8?B?NjdLUEVFQ0NNUzlxemxYVUY0YTh6K3VYcVU4REhURzRCc0duOHNiTlZrS21F?=
 =?utf-8?B?N0tyVS9idGVGL1JVaDJJUUROWXBXL3lHQ3VEbG9UalMzUnFWS0dHQmhPZ1NQ?=
 =?utf-8?B?N29ZOHpGUnIwa0JGTU9zSUgxYXlsTlA4MlZGV0pHekFxTm9TeUtuN2pNOGhs?=
 =?utf-8?B?KzcxQ0tBZlVzclNzTUxnZ0VSSlBoZ0dtZC9kZGdmVGc1VS8yYmhzS2ZZNi8r?=
 =?utf-8?B?b3kvNjhmajlPenB4dzJqYzhVWE5Zck5zd1JBZXorc3FGR0ZqMUFWZHFPSDVi?=
 =?utf-8?B?OWRIN2lFbXdoS2VuVWVNbWpaVUVBM1dvbWNlRkQzQnBHM3lmRVZTd0t4UmNG?=
 =?utf-8?B?L1dGcjBoZUV3cTlnbUszYm5BeUxRcG9ZWldZbGxsUXR6cXpLZ2dVa3hXWjdB?=
 =?utf-8?B?TG1JelNpL0pZaFF0ZjFVcDQ0ZDd2UjBCcUNJd01LNWJKQ2FydWZIQm9TOTNx?=
 =?utf-8?B?MkRBVGRYbnNheXlSc2dxbXV1T1JtWWZFSU9kcUV4SDRCaXVpN0ViRVlkK3Mx?=
 =?utf-8?B?Uld0anV1dkxQQnhlSm0vcU9YNVNpNFFuMUxIMzJDUUlVcFhETlpLWE1CZTVH?=
 =?utf-8?B?eGRWdk1nRGtNK1VlZjIyMFV4bVk2T0tsa3hyZUN4MWJuYXRKR3hzRHcxYkxL?=
 =?utf-8?B?K1B6UU5SeE5HcmpBM1FZazZydTFqMVRkWUZEVGZFSklEZEFmbTh1c3RNSkFl?=
 =?utf-8?B?R0lmSGtoZm92ZUN3YnRsSG1xNE52Y05aUVU4Y2hNUTJMSFVlczMxYkFvR0lk?=
 =?utf-8?B?TExPZ0M2cUN4RFMvSFV3aVV1Z2l2cjg4VjBKdHIxOGNRR1puWkgranA2bTFx?=
 =?utf-8?B?NSswTTJlQjU4eXMzazhQTk94c29iSmVUVHZkTkZVVU8zNXpjeUd5RkJkQVJD?=
 =?utf-8?B?NEl2eVU1QUplSXUzdm16WXBhbmNHYm8rWWlabmNiQ3p0UFE1OUttdm9vWEZ2?=
 =?utf-8?B?cnZuWHUxMWJJTE52NzJLQXlIZ3lydmF5OUhnZGltZzFHK0pXbW5kMC9CMmJE?=
 =?utf-8?B?dzRtOWZFaDgyQXBjZG5mTm9Qb1FNZ0FwQ0pqUmFaRzlsSnkwMktBaDdPR3dk?=
 =?utf-8?B?M0V6QWpMT05jd3dCN3dVV0tYcUg4OWYvcGZOcmlZY1VUc2xFMmM0NWJNRFBN?=
 =?utf-8?B?VmlpMGFCL012U0F3KzhPUWNrcFl3YnJER2s4YjRkRUN0enRreUEvTExlT2Y0?=
 =?utf-8?B?bjBVeC9BckphQS9JWjJGbVRKcUhTalBFUHhYL0QzTWtoM055NmhVa2RQNUxT?=
 =?utf-8?B?VnNwR1FRQ2Z2OXNLNTJkR3QxZGJ5eWIrSElyMzk2TUZIaGFrOGQ1dGQxeDJF?=
 =?utf-8?B?MXNFazU3NHJGMXlNcGo1ekkvN1BsSFN2QlFrTnF5NG04YkFnLzArdE1PTEpH?=
 =?utf-8?B?Z2dVdzY5eUtXN0M2Rlc3bmZaZkdWeUpXZS9NV2YxcElNQlVkMWZ1ZUJIUzI3?=
 =?utf-8?B?VlhKN2lTb29Oeno5MVg5OG1jaGxuMEhZMUlGQ3pKV25vTndSK2RMdmRWb2pM?=
 =?utf-8?B?UTBYRHh2Ym9SWGd0ajR4NFFhRjAwREdOZlg4NnV5WEdPVjBidVpkaS9zc0hv?=
 =?utf-8?B?QVNZYjc1VUhJdmpaTUpTaDY5R0JBWHhXWTlGU1JGaFA0cHUra2tVMEZCS0dH?=
 =?utf-8?Q?61QI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ymg3UVl2YXZTNUpYTDRNTTRLb0swcmNnZWM2R29jdWFVWmxXZllTOSt3OWRI?=
 =?utf-8?B?SG0rMUFQQUMvT2VpNUhsUm95ZXY3MlIvWUphNXhjWTZSdGNtL0JWM202c1Zo?=
 =?utf-8?B?dGtQbVJ5WFIxM0RBelVmQXVIVnlRbG5VT21lUDlRRWhMYjVsTmxydDcvU2xt?=
 =?utf-8?B?TFlzQng1Qk9xNU9VbFozOXdRM3ZUdjROdVhJWStLWFBCekYzZFhEWnM2V3Zw?=
 =?utf-8?B?TW85dGJkL1pmSUZYRmZpa3k5Q3hzZTJTa0FpWVBZcWRwcWpyQ3hNdDlRZkMy?=
 =?utf-8?B?ZDM1Tk5sOHVtVVYzNTAwbTFDYXNmYUxrcFFGQ2Y0MEFPWi84Z25BeXV1Smd2?=
 =?utf-8?B?QXg0QWNVWFdNUzBOT05lMWcrL25mWnFZdG5GNDNpOER3ak4yL0pRNDlwV1VZ?=
 =?utf-8?B?WnN6RXE0V1d6OGtVMjVzTmZGZjgwODhGZkM1UHpxMG9iaUVlZEFaNGdwTjMr?=
 =?utf-8?B?TXhoNnJMc3E2WStsVUt6ejlCQjNUZ0xyQ042SmhDejg1SlF6Skg2VmU1MGR4?=
 =?utf-8?B?TkE2UW4yVTUzVmVhM0hUSWFMUldBOW9jcmtjNTFtdEVHUVdIajBQUk5jL295?=
 =?utf-8?B?aUhOYjNmbnpNeXVaNnRBSFhWWFZ5Wjluck5zb1pqZEtBL2N3dnFBbnFtalA2?=
 =?utf-8?B?ZDl1VFNRU21PQUZjOVphR3VPY01XdER3MnNHVE5oQTludnUvWjl0d0ZJSlB5?=
 =?utf-8?B?OXd6RUNmQWU0QzNRQ3BTSHByM0ppWXBEaGV1bmxkbWRmYUI0TTRnQXBnUVZ5?=
 =?utf-8?B?bmhuT0pULzZ5Q3k5SjVCZWdqeGtMVXFqVTdqZjkyWjBqYWN4L1Z2WTlzRm5X?=
 =?utf-8?B?VHF3c3pnTXJCanB3NG1EWlI1SjBMMVJTa01IWkVicXVTdFRLdHdwSGhwWkJi?=
 =?utf-8?B?Z2Rvckx5MVJtRmNVODlkYVJkaGtUYm9rem9aK3pGQTFFK1ZGbTNmanQ5L2k1?=
 =?utf-8?B?TTVMTmNvVkJ6WGNvMUtpRGtCaU9FOUE1MWcwcHVwc2p0bkUwVndYUUVhMmMx?=
 =?utf-8?B?WjYza1BVZjRndWJ2Y3I0aDJuMmt6aFEzT3pmSTNLNGNUb05jV0RNVUFSeE1y?=
 =?utf-8?B?RGovVjVEdk44c1g2dGxVV3RtZTVnWkhpYjlQKy9UdVdadXpBQllYVHFrUkVs?=
 =?utf-8?B?Q3NRVnk4TmN5MmkzMHZ3TkhKWU0rekROTStPZTdJTWtpZnRjWHVXSFJOUmZK?=
 =?utf-8?B?Vkd4MmRnNDV0eGtwSGkxMGl0YTNNSnMwNjhtbVpJMklOcTFuOE1OaHZva001?=
 =?utf-8?B?UEZuZ0lRN25JbkJqaUVJR1BEK0k5TlZWd3lSb3AwM1pmOUgwWmE0SmRMWXVD?=
 =?utf-8?B?M3dUNmNEeFNwb2tuZTY3NStXWXlPL1ZnRjVneVdHS2VqVVBTejc0bVV4SmVV?=
 =?utf-8?B?ajBWYk5BR2tJVDRNaTRlZmpadldTU1FTTGE1TEJUZHZLSTgrQ2J3M0Q2Uzdn?=
 =?utf-8?B?b2xjWkxia2RTS0hHeEQrVGZsVjJ0T1orTGphYno2RzEwZFdDUkJNMlVkT3lY?=
 =?utf-8?B?VVFHTzYvTzFwSk5UM0JCNFBkMGExL2hJdnVWQkQ1bGp5V3F1cURGU1hMcTIr?=
 =?utf-8?B?OW5ManFXU3JKWU5nckFhWkRoeDZpaHRzQnJJSTRxTzEyQ2RmN05YRUdWcmV4?=
 =?utf-8?B?YVB5RVBWb05hZGdJc1BESmNldC9BQ3F6ZHJCaThrS3MwbElVcXN4aXVrOVg4?=
 =?utf-8?B?MTlYcFZ0SXhtU2ZPdktwRmgvL2hpOTh3cmNobXFYOVJERml5bDdaZm9RalRN?=
 =?utf-8?B?RENvcnFKUVhLUEloaDEvbkFzMkxJVmFTSy9PcDVYY2pYZUxEUWQwOGZPVkFE?=
 =?utf-8?B?ank0ZGRYMXpnb1BYdXpCTzl6cGU1ZEZxZW9JNHFLelM0bUNDM1p3N0pST3l6?=
 =?utf-8?B?NWY1dVdjNG5GYXp5RDZobWw4T2hKMGZ3WW1BbCs5QW5waW9EcmFMWXJub0Ja?=
 =?utf-8?B?OVBnVUdRNEJoS2piQ0hrWW93NFpMNXBuSHZmdy80bndZVHMvUllmTmljQUVp?=
 =?utf-8?B?Ykxwb25KZDhpK0Q2QlRDZndlcWtqUzgzYXArSXFyQWozSDMyVHorRUFZYUR0?=
 =?utf-8?B?Z1FSZUFHdEhTbEhpbkxPY1hZbER5aVpKMnhSc3FmTllza0JQKzh5enVHVXJm?=
 =?utf-8?B?aGFZMUkwd1kyWWNHbmtwYTBFaFg5cXhCQ1FIeDQxZGpvdll1OGxubDBtOVlz?=
 =?utf-8?B?T3p1dXZoQUJUNzdPZkxqQzdKYTRYRzQ0TEs3eHpWZkFpN29ScTBrSWx6ZzRk?=
 =?utf-8?B?Yndzak5EZm1jUnMxbXVWWjdjVWhyZ3B4d0w2NkJlcnNOZjh1RWRhdHcxaC9J?=
 =?utf-8?B?NFRQMXZCQndWY2hBdHR2dkg0V2Z0b1lBSUdheHMxRlVPRTZQcERDRkZKeXk3?=
 =?utf-8?Q?ydNwYayGnrndiGu8=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d79d06-0a84-46db-49be-08de54072647
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:24:41.8108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkpC+98J23Yno8Im3goUNXBWSWo+DyvX0BfhLt4rgMMqjJoA112hCnCkz8e8ymvpSW1QCb/DdSSCbi2qNVgrdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB8787

Hi,


On 14/01/2026 17:37, T, Harini wrote:
>> +++ b/drivers/rtc/rtc-zynqmp.c
>> @@ -208,13 +208,13 @@ static int xlnx_rtc_read_offset(struct device *dev,
>> long *offset)  static int xlnx_rtc_set_offset(struct device *dev, long offset)  {
>>         struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
>> -       unsigned long long rtc_ppb = RTC_PPB;
>> -       unsigned int tick_mult = do_div(rtc_ppb, xrtcdev->freq);
>> -       unsigned char fract_tick = 0;
>> +       int max_tick, tick_mult, fract_offset, fract_part;
>>         unsigned int calibval;
>> -       short int  max_tick;
>> -       int fract_offset;
>> +       int fract_data = 0;
>> +       int freq = xrtcdev->freq;
> Please follow reverse XMAS tree style.
I can fix this with a follow up version.

Thanks,
Tomas



>>
>> +       /* Tick to offset multiplier */
>> +       tick_mult = DIV_ROUND_CLOSEST(RTC_PPB, xrtcdev->freq);
>>         if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
>>                 return -ERANGE;
>>
>> @@ -223,29 +223,22 @@ static int xlnx_rtc_set_offset(struct device *dev,
>> long offset)
>>
>>         /* Number fractional ticks for given offset */
>>         if (fract_offset) {
>> -               if (fract_offset < 0) {
>> -                       fract_offset = fract_offset + tick_mult;
>> +               fract_part = DIV_ROUND_UP(tick_mult, RTC_FR_MAX_TICKS);
>> +               fract_data = fract_offset / fract_part;
>> +               /* Subtract one from max_tick while adding fract_offset */
>> +               if (fract_offset < 0 && fract_data) {
>>                         max_tick--;
>> -               }
>> -               if (fract_offset > (tick_mult / RTC_FR_MAX_TICKS)) {
>> -                       for (fract_tick = 1; fract_tick < 16; fract_tick++) {
>> -                               if (fract_offset <=
>> -                                   (fract_tick *
>> -                                    (tick_mult / RTC_FR_MAX_TICKS)))
>> -                                       break;
>> -                       }
>> +                       fract_data += RTC_FR_MAX_TICKS;
>>                 }
>>         }
>>
>>         /* Zynqmp RTC uses second and fractional tick
>>          * counters for compensation
>>          */
>> -       calibval = max_tick + RTC_CALIB_DEF;
>> -
>> -       if (fract_tick)
>> -               calibval |= RTC_FR_EN;
>> +       calibval = max_tick + freq;
>>
>> -       calibval |= (fract_tick << RTC_FR_DATSHIFT);
>> +       if (fract_data)
>> +               calibval |= (RTC_FR_EN | (fract_data <<
>> + RTC_FR_DATSHIFT));
>>
>>         writel(calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
>>
>>
>> --
>> 2.47.3
>>
> 
> Thanks,
> Harini T


