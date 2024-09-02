Return-Path: <linux-rtc+bounces-1823-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54727968177
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2024 10:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A21E2B206B1
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2024 08:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3FE17F4F2;
	Mon,  2 Sep 2024 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="cUPQ1r8a"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2120.outbound.protection.outlook.com [40.107.215.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C597E4AEF5;
	Mon,  2 Sep 2024 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725264898; cv=fail; b=rHf1M9SyGfu6q8lOlZMGo5P1hNnzPw0VEnOUqEL6B7J/3QsTZFhccsCFpuMuxD1W4WpzQEiS9LEZc/I7iI/dTg2vvvHlOyuSU0ejpqfi3ZWRougAM/U0ef7YKKKtXTnyQBWjD6dZpHtREwU20TSv+DGTN4yOrFoSg5DfXPPg1GM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725264898; c=relaxed/simple;
	bh=oHhOItsh0bQP5YzyQvqu52zWSC8ECUMWHf8xw4D5QKE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h1Ek7piwV43Tv3aY9Q+ClZfYKkEvWIUUgMvCRrts7hGQS1rQlLW6ItTpo5cbJJB6n5C0kN9TgDtQFuPXYFr8u/yfAfy41nZQgHbW7WM5hzg4i/vLj55AhYcV3if3IakMWW0RwbHgwUJb8Ym5yVatHC0JsL/z0sp8wulvlQcYxY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=cUPQ1r8a; arc=fail smtp.client-ip=40.107.215.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Feku5uq67irnC3vLlhzvpHwZIAg/LR7dzMwTUxdZ2mj22jHi+oxhf6jb/3QZfQDK3AOEXDA1AB9YXuPbQkUU647vYYzfOaMwXBa1sjdCXi4P0MgA5OzZf6hBQhnTQbtW/YaMPQNcbJTs19tDDnmyDua3kr0DeWXTHvUzy4ghhpkYGL/RX56Qej1Jx6Kgm08+RP3LesBMTcsN5iKGWUWt6OcAUIcrzMF8dIfuFVliFyw18AD9wwKQ93Z0l/XklcPfc+P8XEOMHyN4CyehQ+xNDtIFMAYalb0j8wgEpdPV9LMDjF6IcGa0hvcbDlz5m9x3QQbnweFXkNkr5kLX+xKhzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjW6JQdi6+xRhG48HbmZ6gtHaikpNhUmwOvu7SOHhes=;
 b=BTA5y/Q4xgu0d1rUDCjxi4LE4RU9e5+7166DKQ5FRW1o/j73O0i6UV3RYErf74T/HNx5yjqPxdYJZBuTo69kdboyjU8tbEP09esShwHmwC95idJcEKWHHh+d6GrOypaRYuBF6MFayt5mmvynLWC1OYgpwDjntPru9trOF0nhoQpRXBxQZlR81I/51sNDvU5cPz8kmpKUrPXYfGe7kD0KWi0KADLRlu9vVW23y07j1EbVw0ruykG00WpbAp2vCHHIaxcPw3dgukODVZIr43eiAlz7vB73hr+meO1il05FsRpzFK/0xNfYBzF4LDyx4KeK+xWXCJWsjXwD5CF+11gudA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjW6JQdi6+xRhG48HbmZ6gtHaikpNhUmwOvu7SOHhes=;
 b=cUPQ1r8aAo5CUEsA0ho28xh2h85j8K8574V1Kurzm0J69AzxTbYE4/iE3ijV3kFlmz6fgVHLKiWxMDh6coRhgrHLmE05ZshwmEtxKAe1ODenS1JD5K759jQuv0NS5kwef5z5UdqJ+oPwzuj2yMQLx1EnO0hkA/fR8xIO4SIlJFdX/i8qIO8VC1LJOUyObk0EjmMw9dGePcXq5AL2Pz4HmWcoJWxmgqjBwbbo2gp39vk8SXiJiQsIgAq9+b4enQfVbVqgfphj0XVmHhdgk0H74cidM0/WIMLaNxJd56kGRCxO4z4NzdQy1TTdEmY5uG1NZ8XaJ5wLFbTqyfO85Y7WkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB6602.apcprd03.prod.outlook.com (2603:1096:101:86::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 08:14:50 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 08:14:49 +0000
Message-ID: <20ffd260-3c24-460f-bdbc-965573e110e3@amlogic.com>
Date: Mon, 2 Sep 2024 16:14:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rtc: support for the Amlogic on-chip RTC
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Yiting Deng <yiting.deng@amlogic.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
 <20240823-rtc-v1-2-6f70381da283@amlogic.com>
 <2024082609451907fd19e2@mail.local>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <2024082609451907fd19e2@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:195::19) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: 6334f24a-e811-4c58-893d-08dccb275061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzVFKzZ1bXIxTXl0WmQwcG85aGU2U2ZaWE45ekUvOXcyYnNkY3lQZUhaTWhQ?=
 =?utf-8?B?c0R1Q283YTdyVndIZlplbEZuU285TGxEQk9EMzFORHVOV0NVUW9LSjRuUEJv?=
 =?utf-8?B?Vm5NdzdmWk1lNVVjT3daN1JsM1l1WjhtYnpxUjBYVU5XZzJlSlVScEtFMFRP?=
 =?utf-8?B?dzRmckVRelpPU1hSaU9zSHRSMms4OWgwMGtXWUtKTFVZTlV4QUI3ZXhFZmxx?=
 =?utf-8?B?QktNQy93V09JYk5hWDNrVkdXV2Q1WEYwSitTa25jQ0pKQy9yOVdWYWFmNUFr?=
 =?utf-8?B?TUtubk1sWklWTlhucWN0QmN6em9VeGZnUldreFpZdUZLTHF0MCsvdis3OWFC?=
 =?utf-8?B?MmRha0JxWHE2ODg3bE1XemF3ZnpoL09TVEhoL1MxVlFXa2FKcU8vQXF3WXdm?=
 =?utf-8?B?SnVaaXoxSXBuaUxUU0kwdkp0VzRtM2NiQVNWSUNBajluRGhEMDJHcUp3Qk5L?=
 =?utf-8?B?U0NjQmMxU0czVUJHN2doR25LaXJycHpvazRjeURhM2pONWFHeWwrMlFJOHRl?=
 =?utf-8?B?Y3FISW9DWko3NHkzdmlTOVRXSWxDODB6UnpEZFMwK1dqVGQyNUJ4NVdPUkI5?=
 =?utf-8?B?eHNFS29haUZQU3ZjTjNvb1dLbE9NVVM2Y1ZwbVhKQmk4dzVjOTlHWDZZYm5E?=
 =?utf-8?B?dVVDL3FsOXVmWkdLeWcxUnptUkV3VXBpT1Fsam5YbzBiQUplSzQwNHg2TFBN?=
 =?utf-8?B?cXVVeThKTzFqVXJjeENGb20rSjQ0ckFjRjNPcUR4M3lTQ3g3c2JaQmRMdlJR?=
 =?utf-8?B?aEpNZUN3bnk1WmJ3b0F6cXJ2SUE5RmRvcUhQTlFSRGlvZnZJMGdGZ1d2YmxY?=
 =?utf-8?B?WU1namVWeER6MklKKzR0VzJJSmgwY2E4NXRuMVN3bmpFanhERnVuekhNbWM1?=
 =?utf-8?B?a2RwNmk0STBpTEIvRkVpejVEV2JXOTlSTFlFOGRUZTl0WFlDa2NJOHhlT0Zt?=
 =?utf-8?B?Mk01NlBINlZGdG5XdFpZdzlyVkxodE4yN0p4dnpHL2FwdGlaZmxxLzN6MHVR?=
 =?utf-8?B?ZUZvRk9LaXNUTEIrT2I1OHBQNm5CeFdhR2VCTDl1OGU4emI1N1NaeXRIVjBH?=
 =?utf-8?B?UU9kbGRSS2h3SjJISlh5ZUlOeTFBNjI0RVlacEVJY25oWElqM0MzMXA1WE9G?=
 =?utf-8?B?UjJKQ0xZY2hUdUErZk1WOWdFM0xHUDdjbkRGSW5GMFJvZ2d0UG5heHpYalI3?=
 =?utf-8?B?aHRNOG8wNXhvZU40eGsxWUJuVFgvaWdsa0lyWFRkVFJEaWxsUnl1Q2luMDU1?=
 =?utf-8?B?TGhReWRlWFRQL2JMNDBDKzl0a1l6d1QraUJXNjdDK1c5a3pzYWgzRGpEaXlM?=
 =?utf-8?B?WmpyRi9kL1BMeU5QSmJlY3lDS1h4Q3FXZDBKNXFsVkMwNElGb1QxQmZObExV?=
 =?utf-8?B?WklEbVhOZGd4a1hlb2kwM0lvRjU0ZUt3dlluT3IrQWhzUUpZb1IydE5zTzkv?=
 =?utf-8?B?QnVqWi90b2lzRUZ2TVJjMGZ3YStQcmdZM1hKUEYzN3JLTzF1Z3ZMNHpzQWdq?=
 =?utf-8?B?STVCd0dYSS8zaEhXRXJldDhic1RGcEtwYzF2eWZlZmFMTElJcjJXNjRERjRJ?=
 =?utf-8?B?cmlBamc5TkJwaVgrS0FOR3MyTnpsakpHajFzWU5Ib0xvMk93VENZMDE4a05k?=
 =?utf-8?B?ZG1KRUFwM2RhYlAyb2VMWlFDSjk5KzRReEF4bUJwSkdic292Q2Z6dWVPNGtw?=
 =?utf-8?B?dDBiWmpKV1dRcGoxZVRWYktETXczZjYvSUk2UVdOUWRJdDBPclpBNHRkNytV?=
 =?utf-8?Q?IlmbgFjspptzeJ/QBA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2ovOEtLcHlIQ0cxY2F2bmlOVWFvY2NaSE1uMi9wYmR1TkJQZjcxdXZ1UzYv?=
 =?utf-8?B?UGxDdU03THBsQlc2REpVUnBVY2luZk1mMG55c2g3N0szZ2hiZ2NMdUtpVTF3?=
 =?utf-8?B?QWkyQUhyeWNJWnFZNi9BNWZzb2VGOE1zdGk5N1o3U2xWYXRPUGMzQ056WmlD?=
 =?utf-8?B?MWFUOUNRSG12RWxvVWU0Vmt3OUh5bExGREZqOFM0QzI1bWVxelBVNTlsU3Vx?=
 =?utf-8?B?M0oweXR5eFJGYXZ3WEZHMXpRb0FOeUZaWkpUOGFRUExtcWdOQ3JVQUpxcnpv?=
 =?utf-8?B?WW9oaTgySkN0eWIwaEpkT3RDdk0zUlVWM2pZd2ZtSi8xdk9qRkRtS3UrSkNJ?=
 =?utf-8?B?a3Zwck1rUFpDbmhpYWpXMWMvMmtLYnRackVDM205dUV4L0lJNm45YlU5Zm5F?=
 =?utf-8?B?VkZRbjF5ZnVpMm1iMXNWWUdIWXlEZWd4WXZOZ2hQMXVIcGJrUGpYbmFUVWgr?=
 =?utf-8?B?VWNiTXhiM293azNETWJJV3pwSlF2b2lNR2dwVzdpYkJ2b1FqVEM2bjBiZ1pp?=
 =?utf-8?B?cy9nQU5SblBNS01hWDVDTXljbUxnbmRldGhidDdGaVFwRC8zYUlOSVlYaFFo?=
 =?utf-8?B?Y0djQVUrUGVQR3Q4V0tVOE1qSzNMc1pjSFk0dis5SEduNEpNZmsyQkdSa3Z6?=
 =?utf-8?B?MytuZEljZ21mVndNSDIvNzJHNko5UmliYW1raGxJa2cyZDlKZE5RY2diUVJy?=
 =?utf-8?B?bExteFFHK3hzcnloT2RzQmd2UWU4dDJUdURrWXFUWFFaTW5kZ2hxcFJ1TXA1?=
 =?utf-8?B?VW5LNG5QUi9wMVFaN1BvUlgrYkZFdVNqZmt1K1ZCQzlYVkx2eVR4Y1NqN2p0?=
 =?utf-8?B?aDRYR0l2N0QzczYxUXhsMWRuU21ndXp4ME8vUlhLc1JMb2VZL0JabGpzQmxS?=
 =?utf-8?B?b21XVFVTU1IwMDJMaCswdjRjWUxQRUFabUE4dVQzbUw4WmNrTmY4V0NyN0tt?=
 =?utf-8?B?anJSdUNwTmJLMTBIRHBxSmFNTlR3UW8zRXJ6S21hcmtMRVFJS0lWZVh6U1Ju?=
 =?utf-8?B?bTVwcGJEay80MExzRWVRVHdRZXhqTzE3UVkzN1phNEZiSERTaXh2ckk5RW95?=
 =?utf-8?B?QkduVk1QdmN0aG5QRHM5SEJ5Rlk0VFJTLzdhRDNjYlM3SFVjY3o5U01DTmdk?=
 =?utf-8?B?MGkzU0xOQWlmZXNhMjg3WWNBT0FCeE9Fa01Nd2JSZmFrRmR4SVQ4YyswNUZ3?=
 =?utf-8?B?UklVc0JxUnQvd2Y5ZVh1TjNsZWNCRVlZODZKaEVIQnphSjh3ODJRQm56QTR1?=
 =?utf-8?B?RS9YN0JXNzJBeVlnZ0ZQZ3l2NitldXlhd0c4WEkzaXRKVm9Hem9ISGtMZ3F4?=
 =?utf-8?B?dTRKeSt2NXJHL2IrSFhHa0VlRXV2cmI1NUdsYU1KTkpwZ2ViMEdWNlN5L0VP?=
 =?utf-8?B?ZkNLdGc5WmFQSG44SGJDTXVIQytCOTFqdjN4dkdnMVRhNnFqanl4L1R3NlZk?=
 =?utf-8?B?aXNXNWVoUE5IbkE3KzFCVkE5ZUNsN0xUYWlEOXc1bjRxMGduMzJLTWlvdUt6?=
 =?utf-8?B?YitwQ2o4WEVPMlZTWE1oSTVtdWE0cUNvRy9jMVA0NXFXWWJrZGVFeHJEcXpw?=
 =?utf-8?B?clJVMzBUTitMUk0wT0VuT1NZek02QUs4dnhEWndNUjJxeEN1eHVmNnpLZjU3?=
 =?utf-8?B?blF2ZmZVKzR3WGtLd2NkejVMYzE3NTA3UnFDbk0rdHZzT2ZLTlVXSEVZR09E?=
 =?utf-8?B?T0JFL29qN3N4QU9HNlRmWmpLeWNaTkFFY1dObWlHd2lWWG9oNVdHOXMyNlpm?=
 =?utf-8?B?cW16L2ExdlgxOFQrcmlJczh4bXo3bWNnM2hpWVM5K3ludlpjdjBkcCtMRitn?=
 =?utf-8?B?RzlSRVlKdFpxSjFUQW9wbS95TTlaUHFobjJuVFF2VFlVQko3Qmo2M3ZGOHRw?=
 =?utf-8?B?VDBDWlVON0ExQmZXN0cyTGNDSVZoUDU5cHVyU3loVnA0eXlaaVRlVXpCaGhO?=
 =?utf-8?B?K3RHZHlhU0ZBSU9UejZzamNDeTNiRGJFY1VMY0J3UmNVWEwzeW1JVURUWTJR?=
 =?utf-8?B?TUVDZGY2ajlnU2YwSXZJRWx1SmcvVEVKSFM5OXBMOTdVQU9RNm1lZEt2NExm?=
 =?utf-8?B?TEhKbitsUHRFNHZ5TlFBYkZNQldlaTdhd3o1ZEozTmV5QzVadWJnVU5DVm1Q?=
 =?utf-8?B?bzlWbzYzUkxGS0RNLzFNM1BldExJWG5oSU5zV01NWEcrM1dlVlZlbE5CakhI?=
 =?utf-8?B?OWc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6334f24a-e811-4c58-893d-08dccb275061
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 08:14:49.3756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvZtUoH0xF+NyOYieODxjo2AURaedJP/GaxALuzPHBPJH4npzY+ZTFxGWKnW/BIbYx04o+6RmmBLw1mK+iZtJPwLwrg2f8SjbPyW5eo/ESQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6602

Hi Alexandre,
     Thanks for your reply.

On 2024/8/26 17:45, Alexandre Belloni wrote:
> [ EXTERNAL EMAIL ]
> 
> On 23/08/2024 17:19:45+0800, Xianwei Zhao via B4 Relay wrote:
>> From: Yiting Deng <yiting.deng@amlogic.com>
>>
>> Support for the on-chip RTC found in some of Amlogic's SoCs such as the
>> A113L2 and A113X2.
>>
>> Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   drivers/rtc/Kconfig       |  12 +
>>   drivers/rtc/Makefile      |   1 +
>>   drivers/rtc/rtc-amlogic.c | 589 ++++++++++++++++++++++++++++++++++++++++++++++
> 
> As pointed out, this is the third amlogic driver so the name of the file
> must be more specific.
> 

This RTC hardware includes a timing function and an alarm function.
But the existing has only timing function, alarm function is using the 
system clock to implement a virtual alarm. And the relevant register 
access method is also different.

The "meson" string is meaningless, it just keeps going, and now the new 
hardware uses the normal naming.

>> +static void aml_set_time(struct aml_rtc_data *rtc, u32 time_sec)
> 
> Is indirection necessary, this function is used only once
> 

I will delete this function.

>> +{
>> +     if (rtc->config->gray_stored)
>> +             time_sec = binary_to_gray(time_sec);
>> +     regmap_write(rtc->map, RTC_COUNTER_REG, time_sec);
>> +}
>> +
>> +static u32 aml_read_time(struct aml_rtc_data *rtc)
> Ditto
> 
I will delete this function.

>> +{
>> +     u32 time_sec;
>> +
>> +     regmap_read(rtc->map, RTC_REAL_TIME, &time_sec);
>> +     if (rtc->config->gray_stored)
>> +             time_sec = gray_to_binary(time_sec);
>> +     return time_sec;
>> +}
>> +
>> +static u32 aml_read_alarm(struct aml_rtc_data *rtc)
> Ditto
> 

I will delete this function.
>> +{
>> +     u32 alarm_sec;
>> +
>> +     regmap_read(rtc->map, RTC_ALARM0_REG, &alarm_sec);
>> +     if (rtc->config->gray_stored)
>> +             alarm_sec = gray_to_binary(alarm_sec);
>> +     return alarm_sec;
>> +}
>> +
>> +static void aml_set_alarm(struct aml_rtc_data *rtc, u32 alarm_sec)
> Ditto
> 

I will delete this function.
>> +{
>> +     if (rtc->config->gray_stored)
>> +             alarm_sec = binary_to_gray(alarm_sec);
>> +     regmap_write(rtc->map, RTC_ALARM0_REG, alarm_sec);
>> +}
>> +
>> +static int aml_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +     time64_t alarm_sec;
>> +
>> +     if (alarm->enabled) {
> 
> Why aren't you setting the alarm when it is not enabled?
> 

Will delete this judgment.


>> +             regmap_update_bits(rtc->map, RTC_CTRL,
>> +                                RTC_ALRM0_EN, RTC_ALRM0_EN);
>> +             regmap_update_bits(rtc->map, RTC_INT_MASK,
>> +                                RTC_ALRM0_IRQ_MSK, 0);
>> +
>> +             alarm_sec = rtc_tm_to_time64(&alarm->time);
>> +             if (alarm_sec > U32_MAX) {
> 
> This is never going to happen, the test and error message are not
> necessary.
> 

Indeed, will delete this part of the processing.

>> +                     dev_err(dev, "alarm value invalid!\n");
>> +                     return -EINVAL;
>> +             }
>> +             aml_set_alarm(rtc, alarm_sec);
>> +     }
>> +     dev_dbg(dev, "%s: alarm->enabled=%d alarm_set=%llds\n", __func__,
>> +             alarm->enabled, alarm_sec);
>> +
>> +     return 0;
>> +}
>> +
>> +static int aml_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +     u32 alarm_sec;
>> +     u32 reg_val;
>> +     int alarm_enable, alarm_mask;
>> +
>> +     alarm_sec = aml_read_alarm(rtc);
>> +     rtc_time64_to_tm(alarm_sec, &alarm->time);
>> +
>> +     regmap_read(rtc->map, RTC_CTRL, &reg_val);
>> +     alarm_enable = FIELD_GET(RTC_ALRM0_EN, reg_val);
>> +
>> +     regmap_read(rtc->map, RTC_INT_MASK, &reg_val);
>> +     alarm_mask = FIELD_GET(RTC_ALRM0_IRQ_MSK, reg_val);
>> +
>> +     alarm->enabled = (alarm_enable && !alarm_mask) ? 1 : 0;
>> +     dev_dbg(dev, "%s: alarm->enabled=%d alarm=%us\n", __func__,
>> +             alarm->enabled, alarm_sec);
>> +
>> +     return 0;
>> +}
>> +
>> +static irqreturn_t aml_rtc_handler(int irq, void *data)
>> +{
>> +     struct aml_rtc_data *rtc = (struct aml_rtc_data *)data;
>> +
>> +     regmap_write(rtc->map, RTC_ALARM0_REG, 0);
>> +     regmap_update_bits(rtc->map, RTC_INT_CLR,
>> +                        RTC_ALRM0_IRQ_STATUS, RTC_ALRM0_IRQ_STATUS);
> 
> Are you sure regmap_update_bits is necessary here?
> 

There is only  write RTC_ALRM0_IRQ_STATUS, to clear it. will fix it.

>> +
>> +     rtc_update_irq(rtc->rtc_dev, 1, RTC_AF | RTC_IRQF);
>> +
>> +     return IRQ_HANDLED;
>> +}
>> +
> 
> 
>> +static int aml_rtc_adjust_sec(struct device *dev, u32 match_counter,
>> +                           int ops, int enable)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
>> +     u32 reg_val;
>> +
>> +     if (!FIELD_FIT(RTC_MATCH_COUNTER, match_counter)) {
>> +             pr_err("%s: invalid match_counter\n", __func__);
>> +             return -EINVAL;
>> +     }
>> +
>> +     reg_val = FIELD_PREP(RTC_SEC_ADJUST_CTRL, ops)
>> +               | FIELD_PREP(RTC_MATCH_COUNTER, match_counter)
>> +               | FIELD_PREP(RTC_ADJ_VALID, enable);
>> +     /* Set sec_adjust_ctrl, match_counter and Valid adjust */
>> +     regmap_write(rtc->map, RTC_SEC_ADJUST_REG, reg_val);
>> +
>> +     return 0;
>> +}
>> +
>> +static int aml_rtc_set_calibration(struct device *dev, u32 calibration)
>> +{
>> +     int cal_ops, enable, match_counter;
>> +     int ret;
>> +
>> +     match_counter = FIELD_GET(RTC_MATCH_COUNTER, calibration);
>> +     cal_ops = FIELD_GET(RTC_SEC_ADJUST_CTRL, calibration);
>> +     enable = FIELD_GET(RTC_ADJ_VALID, calibration);
>> +
>> +     ret = aml_rtc_adjust_sec(dev, match_counter, cal_ops, enable);
>> +     dev_dbg(dev, "%s: Success to store RTC calibration attribute\n",
>> +             __func__);
>> +
>> +     return ret;
>> +}
>> +
>> +static int aml_rtc_get_calibration(struct device *dev, u32 *calibration)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
>> +     u32 reg_val;
>> +
>> +     regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
>> +     *calibration = FIELD_GET(RTC_SEC_ADJUST_CTRL | RTC_MATCH_COUNTER, reg_val);
>> +     /* BIT is only UL defined，and GENMASK has no type, its' donot used together */
>> +     *calibration |= FIELD_PREP(RTC_ADJ_VALID, FIELD_GET(RTC_ADJ_VALID, reg_val));
>> +
>> +     return 0;
>> +}
>> +
>> +/**
>> + * The calibration value transferred from buf takes bit[18:0] to represent
>> + * match_counter, while takes bit[20:19] to represent sec_adjust_ctrl, bit[23]
>> + * to represent adj_valid. enable/disable sec_adjust_ctrl and match_counter.
>> + * @buf: Separate buf to match_counter, sec_adjust_ctrl and adj_valid
>> + *    match_counter: bit[18:0], value is 0 ~ 0x7fff
>> + *    sec_adjust_ctrl: bit[20:19], value is 0 ~ 2. 3 to insert a second once every
>> + *    match_counter+1 seconds, 2 to swallow a second once every match_counter+1 seconds
>> + *    0 or 1 to no adjustment
>> + *    adj_valid: bit[23], value is 0 or 1, 0 to disable sec_adjust_ctrl and
>> + *    match_counter, and 1 to enable them.
>> + */
>> +static ssize_t rtc_calibration_store(struct device *dev,
>> +                                  struct device_attribute *attr,
>> +                                  const char *buf, size_t count)
>> +{
>> +     int retval;
>> +     int calibration = 0;
>> +
>> +     if (sscanf(buf, " %i ", &calibration) != 1) {
>> +             dev_err(dev, "Failed to store RTC calibration attribute\n");
>> +             return -EINVAL;
>> +     }
>> +     retval = aml_rtc_set_calibration(dev, calibration);
>> +
>> +     return retval ? retval : count;
>> +}
>> +
>> +static ssize_t rtc_calibration_show(struct device *dev,
>> +                                 struct device_attribute *attr, char *buf)
>> +{
>> +     int  retval = 0;
>> +     u32  calibration = 0;
>> +
>> +     retval = aml_rtc_get_calibration(dev, &calibration);
>> +     if (retval < 0) {
>> +             dev_err(dev, "Failed to read RTC calibration attribute\n");
>> +             sprintf(buf, "0\n");
>> +             return retval;
>> +     }
>> +
>> +     return sprintf(buf, "0x%x\n", calibration);
>> +}
>> +static DEVICE_ATTR_RW(rtc_calibration);
>> +
>> +static int rtc_set_div256_adjust(struct device *dev, u32 *value)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
>> +     u32 div256_adj;
>> +
>> +     div256_adj = FIELD_PREP(RTC_DIV256_ADJ_DSR | RTC_DIV256_ADJ_VAL, *value);
>> +     /*
>> +      * AO_RTC_SEC_ADJUST_REG bit 24 insert/remove(1/0) a div256 cycle,
>> +      * bit 25 valid/invalid(1/0) div256_adj_val
>> +      */
>> +     regmap_write_bits(rtc->map, RTC_SEC_ADJUST_REG,
>> +                       RTC_DIV256_ADJ_DSR | RTC_DIV256_ADJ_VAL, div256_adj);
>> +     /* rtc need about 30ms to adjust its time after written */
>> +     mdelay(30);
>> +
>> +     return 0;
>> +}
>> +
>> +static int rtc_get_div256_adjust(struct device *dev, u32 *value)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
>> +     u32 reg_val;
>> +
>> +     regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
>> +     *value = FIELD_GET(RTC_DIV256_ADJ_DSR | RTC_DIV256_ADJ_VAL, reg_val);
>> +
>> +     return 0;
>> +}
>> +
>> +/**
>> + * div256 adjust function is controlled using bit[24] and bit[25].
>> + * transferred buf takes bit[0] to represent div256 adj val, bit[1]
>> + * to represent div256 adj enable/disable. div256 cycle means that adjust
>> + * 1/32768/256 once by written once, it's val is equal to 1/128s
>> + * @buf: 3: enable div256 adjust and insert a div256 cycle
>> + *    2: enable div256 adjust and remove a div256 cycle
>> + *    1 or 0: disable div256 adjust
>> + */
>> +static ssize_t rtc_div256_adjust_store(struct device *dev,
>> +                                    struct device_attribute *attr,
>> +                                    const char *buf, size_t count)
>> +{
>> +     int retval;
>> +     u32 value = 0;
>> +
>> +     if (sscanf(buf, " %i ", &value) != 1) {
>> +             dev_err(dev, "Failed to store RTC div256 adjust attribute\n");
>> +             return -EINVAL;
>> +     }
>> +     retval = rtc_set_div256_adjust(dev, &value);
>> +
>> +     return retval ? retval : count;
>> +}
>> +
>> +static ssize_t rtc_div256_adjust_show(struct device *dev,
>> +                                   struct device_attribute *attr, char *buf)
>> +{
>> +     int retval = 0;
>> +     u32 value = 0;
>> +
>> +     retval = rtc_get_div256_adjust(dev, &value);
>> +     if (retval < 0) {
>> +             dev_err(dev, "Failed to read RTC div256 adjust attribute\n");
>> +             sprintf(buf, "0\n");
>> +             return retval;
>> +     }
>> +
>> +     return sprintf(buf, "0x%x\n", value);
>> +}
>> +static DEVICE_ATTR_RW(rtc_div256_adjust);
>> +
>> +static struct attribute *aml_rtc_attrs[] = {
>> +     &dev_attr_rtc_calibration.attr,
>> +     &dev_attr_rtc_div256_adjust.attr,
>> +     NULL,
>> +};
>> +
>> +static const struct attribute_group aml_rtc_sysfs_files = {
>> +     .attrs  = aml_rtc_attrs,
>> +};
>> +
> 
> You must use the standard RTC API to handle calibration, see
> .read_offset and .set_offset
> 

Will do.

>> +static void aml_rtc_init(struct device *dev, struct aml_rtc_data *rtc)
>> +{
>> +     u32 reg_val;
>> +     u32 rtc_enable;
>> +
>> +     regmap_read(rtc->map, RTC_CTRL, &reg_val);
>> +     rtc_enable = FIELD_GET(RTC_ENABLE, reg_val);
>> +     if (!rtc_enable) {
>> +             if (clk_get_rate(rtc->sclk) == OSC_24M) {
>> +                     /* select 24M oscillator */
>> +                     regmap_update_bits(rtc->map, RTC_CTRL, RTC_OSC_SEL, RTC_OSC_SEL);
>> +
>> +                     /*
>> +                      * Set RTC oscillator to freq_out to freq_in/((N0*M0+N1*M1)/(M0+M1))
>> +                      * Enable clock_in gate of oscillator 24MHz
>> +                      * Set N0 to 733, N1 to 732
>> +                      */
>> +                     reg_val = FIELD_PREP(RTC_OSCIN_IN_EN, 1)
>> +                               | FIELD_PREP(RTC_OSCIN_OUT_CFG, 1)
>> +                               | FIELD_PREP(RTC_OSCIN_OUT_N0M0, RTC_OSCIN_OUT_32K_N0)
>> +                               | FIELD_PREP(RTC_OSCIN_OUT_N1M1, RTC_OSCIN_OUT_32K_N1);
>> +                     regmap_write_bits(rtc->map, RTC_OSCIN_CTRL0, RTC_OSCIN_IN_EN
>> +                                       | RTC_OSCIN_OUT_CFG | RTC_OSCIN_OUT_N0M0
>> +                                       | RTC_OSCIN_OUT_N1M1, reg_val);
>> +
>> +                     /* Set M0 to 2, M1 to 3, so freq_out = 32768 Hz*/
>> +                     reg_val = FIELD_PREP(RTC_OSCIN_OUT_N0M0, RTC_OSCIN_OUT_32K_M0)
>> +                               | FIELD_PREP(RTC_OSCIN_OUT_N1M1, RTC_OSCIN_OUT_32K_M1);
>> +                     regmap_write_bits(rtc->map, RTC_OSCIN_CTRL1, RTC_OSCIN_OUT_N0M0
>> +                                       | RTC_OSCIN_OUT_N1M1, reg_val);
>> +             } else {
>> +                     /* select 32K oscillator */
>> +                     regmap_write_bits(rtc->map, RTC_CTRL, RTC_OSC_SEL, 0);
>> +             }
>> +             /* Enable RTC */
>> +             regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, RTC_ENABLE);
> 
>                  This must not be done at probe time, else you loose the
>                  important information taht the time has never been set. Instead,
>                  it should only be enabled on the first .set_time invocation do
>                  you could now in .read_time that the time is currently invalid.
> 
There are some doubts about this place.

You mean that after the system is up, unless the time is set, it will 
fail to read the time at any time, and the alarm clock will also fail.
In this case, the system must set a time.

When read time invlalid, system is will set time.
This part of the logic I see the kernel part has not been implemented, 
so only the user application has been implemented. Whether this is 
reasonable, if not set time, you will never use RTC module.

>> +             usleep_range(100, 200);
>> +     }
>> +     regmap_write_bits(rtc->map, RTC_INT_MASK,
>> +                       RTC_ALRM0_IRQ_MSK, RTC_ALRM0_IRQ_MSK);
>> +     regmap_write_bits(rtc->map, RTC_CTRL, RTC_ALRM0_EN, 0);
>> +}
>> +
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

