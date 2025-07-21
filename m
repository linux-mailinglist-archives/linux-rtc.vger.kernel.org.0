Return-Path: <linux-rtc+bounces-4533-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B549B0BACC
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Jul 2025 04:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 630CC172A4B
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Jul 2025 02:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D161EB5D6;
	Mon, 21 Jul 2025 02:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="pdUD80er"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022078.outbound.protection.outlook.com [40.107.75.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC91226D0A;
	Mon, 21 Jul 2025 02:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753064881; cv=fail; b=h5NFtyRTalfrUMFDg9wfRRuUBDJNXw2G2DocEOoePau+jEPQ+xZ5y1ZY6dXoD97bcutX+SR1fWKpUx+ttrze5DldwfPWn9u6UyV5uFAw5lTTV1F40xrHFwWxUanTpCCHjtqeEP7lbvlAjIdbpls0bA/4toffaLa3bRImp/jP7sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753064881; c=relaxed/simple;
	bh=EPoXgI9O8RfOkGMxZJZ7WVvYbf5W3MObzQmIdK5N7u0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QNMGPBlsBj48BLmea+3cCeFvyBFsvcVthblE4YA5SfeU6wUnwh9a3FhoOZCp9c0kinCKtU76V5U3qbLt1w38e9mzR8Ok5DNQocJVVv+gg6/pmosUuA9qW0D5ItJTnxgNwe0A44F15B43kpXIw6fsUQI/xu6Y8eu5fgGzC7B0kDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=pdUD80er; arc=fail smtp.client-ip=40.107.75.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIyBM1cTBlDwY+jWBeX4Wnz3v8yHxQX9xoAFN4Am3z6CD/Mxb8YqBVdE5p1uSv0MwoEUnxCpEI5FQL0qFlZxgA+8IkhcAmSbQPXtDWAv/ajFrQ1a6v6oWDD3B8BlmdW1gQO9gJGBYnC0wy8oZ3QujaneJsCR9ETkZgq7Yjd0GXSnuKQNv6H9dyDmxl30jDqoQXwruytXXXDRm6c0IC84mAS8uJGELczvC8WqQoSjKt0xIQtlu9OekIvB7amr5/xcuVcZ3yNqrxqL7oCZqDE0OjEZcoiyQ0zuEOipJAjrUcVY3YJoS5Wz2ulbb8qBunQ88rtV1dnTDRPFqE7r7EBlVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYH4kx3pqi0RsMUCtoFHf1q/ZiBPvz6JfjS1VjQh/Nw=;
 b=V1yZ9kPTGw8lDIqDinA7QyxIopzOBq25pzD8wAjy53erlSi8SVSdFhP3DpwTuKmCfGYLUtPVrfoMHlP2A9/YNUFWGN/do9qEfmB5nJCSh1wNWbc6pgBJmM6PlJfi3tTj5FW6P1fHm6rnXN9WDux2QJgpHbuQAmaaEi1LID17jiUsVZazP3Yzlmc0hK8w6Sjb2yUa4Mxl6WW12tpBA1ZPSt11T1d8ujWSExIx3G1bNbV2gEAjPTNPQK33RGip4lYtMP/nFs7YIyYlqlIu4I1iuMOSpt+Ty1loBSuJkIgFFkAWnV2S8tCoBXSG2p79EoaU0xc8FOhV1gvFowMLm621pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYH4kx3pqi0RsMUCtoFHf1q/ZiBPvz6JfjS1VjQh/Nw=;
 b=pdUD80erk5Yb9kIo0ujDm8FkcTGg9mp4EywS0U4JvHsLcgrHCyZyV6FwIn6Z5hqqlghFrHGNy9C9AuYXjJGLaxds5nZVSMmit+MZFJuPsV+2Jmga5ZurCZMRNExDjF3yVojuN/UqV3Q9mB+dpjKxVh/uTX40A9HwJsxsQTL+5H8i6Mckup7+lk0UlqHa8qYDUTSN9i7vYdfrsXfxOSUWG88H6P5HSGUWDSehv5sJs4WXAsejDKFRBoYhFg1FU0wgcLtjSglkLXqK6AHjRVxLnWF/d1X2d7/2Fstt62ajO/ExS3BIiH4OkSSzLdiUWfcra2bbGdtec15HkgEy+myC8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SI2PR03MB6461.apcprd03.prod.outlook.com (2603:1096:4:1a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.27; Mon, 21 Jul
 2025 02:27:55 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%2]) with mapi id 15.20.8943.028; Mon, 21 Jul 2025
 02:27:55 +0000
Message-ID: <f4037828-be67-4312-b6c5-d3b82a0876f5@amlogic.com>
Date: Mon, 21 Jul 2025 10:27:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: amlogic-a4: Optimize global variables
To: Markus Elfring <Markus.Elfring@web.de>,
 linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Yiting Deng <yiting.deng@amlogic.com>
References: <20250717-rtc-regmap-v1-1-ad19736ccb09@amlogic.com>
 <045fc0c4-417b-4fd5-8bcf-7c7c34fdb01e@web.de>
Content-Language: en-US
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <045fc0c4-417b-4fd5-8bcf-7c7c34fdb01e@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:195::6) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SI2PR03MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: e28ecd81-0767-4ee7-e175-08ddc7fe3326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0k3ZHFxU0J4bFV1cGJKNmxDMDIwc2tNZkFJM3pLbTFXZUtkLzQyb1cyUyto?=
 =?utf-8?B?bWFXVVY2RVhYMzcvOTlZMXdGbXhyWlIyL0ovMWRyZzJvYm8yL2UyL2ZsMlk2?=
 =?utf-8?B?VzlGRGxiOHJhOWExSitSOXgycElMNTR4VytZMlgzWnhKQ0lyRFBOc2tmeHkr?=
 =?utf-8?B?aHU2akhPRGp1WmNscHlGRmkweEMrWXJOV2FWTEtLZ3ZnYXhTa0JLdjAxeWI5?=
 =?utf-8?B?eU1MWmNlT2EzTGlUb29sTDR1Z25nWmdzdFZkR0IrdXRoRUc5b3RVdXJ6RGtq?=
 =?utf-8?B?Z01XaWVPaFVIdkttTU5CNDFwbHdlYkJXOWc3YTc5cm1RU2U2NS9YcWtNb001?=
 =?utf-8?B?MzhwazRqMXZCazBuVkRDdG5vUFllYWZyc0gyN2VRaTJuRHpaUEpRT3lLcith?=
 =?utf-8?B?WE8xNDJ4bHc4TWo3TXJoVDA1Q29xT053VUpSejRmNVhLL29FYUxqcUFVR1ZI?=
 =?utf-8?B?OFVHdTRmeHZYb24vQnVIcGhYOUFSME1rc3VrMmlhdFEyQzFJbjFHa2lPbXFw?=
 =?utf-8?B?cXcyWVZrbk41UnpZSWdYa1FwWFJtK3FxS2lubFZxWjBZN3M5MGFySzdhbEl3?=
 =?utf-8?B?c1QzUGJKbHNCYVZTZWZSWU51WHRBclhTMzlPM29ia1E5Uk0zOWdCR0JJOTUy?=
 =?utf-8?B?OUI5S0EyK1RCWktWOHVUckxBajA1NVU3MjA3Y1hQMllWTEZSWWFlMndNM3Br?=
 =?utf-8?B?NjBnZFFmWWpwQ2FiYXd3bCtIdkEyMkVZdEN5dGlScXI5TjcrQUVvZ3ZLWFJ0?=
 =?utf-8?B?K3NXRDVFWFVsZmxtd2NLVS93cHJSSTd6WnBrUnU0Y0ZxM3dDK0k5emx4Z2xP?=
 =?utf-8?B?N0xjZnBUY2FoMC8ycVNpT1RrQ2JuczhINmRKSzI5TmhrSTk5ZEQ0QjFhdzFl?=
 =?utf-8?B?anRCMlZKMHJkQUpNdStQUnRNZVlhSW01dVV5dHdLWW1OSGREN2ZmbXJiNmNp?=
 =?utf-8?B?ek5HM2R4Q0FHZGRIN0pheFRjMlhkaU5mcEgwZGRJb2NNRkhySU81TERKU01z?=
 =?utf-8?B?NC9CZEt3TjBiRXpBZjZxcW1leHZvSjR2YzZkb1ZhcDM3WFhJZVdDTG4rcW5E?=
 =?utf-8?B?c3NYY1NmSzQyOVlkZjJoZG1JSEJkcW5pbjRheGlGaFkrRDF1NjZrYnNidzFp?=
 =?utf-8?B?bE1tdGdhcDFXQjlTV1NaaDZPSHpjbC9NTkJVSjY1RDYra2Zrb05ZenBtUEZJ?=
 =?utf-8?B?NGpEdGdsNFRjU2E2UlpiTW1ia1F2bUEza09XbkZhK0VBZmJLcGZabjlpY2ZD?=
 =?utf-8?B?dVoxOTJrRmNkVXFaR2NmSFhjNUxQbUF5bk1jVDk3MllYYkdpYXJwamk1M1U4?=
 =?utf-8?B?NWdXK1FmRFVWQUFYOTBvSndad011bEVtdDhqVXUrc0NPdS9vU3JWSW91d2pq?=
 =?utf-8?B?UlZDUEdJSGhFQmtmRDErMHdadUdDUGFlRHBucmUwMzluN1RUOHpDQldwOFln?=
 =?utf-8?B?TEQ2TkU1RHlMaThwSEluRndWdGsxUXlGOWxHR3BLVGp5TWJXWFJKaXJvUW1J?=
 =?utf-8?B?Wk5QcElrUXFqbGlkMytPVkJ4MWEwZ2plTWZUaC9XbTZ5QkZ5c3B0MytsYVVH?=
 =?utf-8?B?TldCTkplZmM3aiswcGRIMFcvblloY1cwWElzQVdReGJTWGRUNXYrSTdDc1Yw?=
 =?utf-8?B?Y2dUSFp6MkMvYjZPU2ZJd1BNaWlRTFAzaGtRWHoyQS9Lbldsb0FTemlrL21z?=
 =?utf-8?B?TGZSbWFvcWdqR1NKRkh1cnFWSmplQTg3SG9xK1Z6dHI2YW9kL2ZtNDBFcXlT?=
 =?utf-8?B?YzI3WVBvd0JJdjdMQkJjdGdnY0ozNnVtUGdZbytXclFoSlpNdXNtRDJuTk9W?=
 =?utf-8?B?WEcvN0loSU8xNFhFL2dobjhmYk8yTVhSQzd4WUNUMitOd3Vxb2JjbERMMHpn?=
 =?utf-8?B?S0wyRmg2TUNLOEtIMUdEYU95aVFPanVnK3Y2Q3JtbnNUYUlMTVZSMlRBUHBn?=
 =?utf-8?Q?+vtv6JNepxk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aCs3M3hOSVJCQXV1NHZnZG1iWWkySW5TaHNYUVJwZHh6OHRKY1J2S0NkcSt2?=
 =?utf-8?B?SUcwK1VudUtqVmNrckNwVWhiSzhpVG1PajQ1Tzk1UVUwOU9WUmQzWHhLbkFp?=
 =?utf-8?B?ZXdJdzdjQURZbzh1cHFCZUZNcnRQZEtoMGhPd1ZrWGVIdTdoajREamZUUWlL?=
 =?utf-8?B?ZU50MDhpMVU1MUoyWkdiZlAwZlF5cnBXRDQ4OUozOTA1dTB6enJTTytZRlUx?=
 =?utf-8?B?NjBzM01IbXRhWDJqYjBpNEhSNXQzZmx6LzQvbklMVXRyR201ckt4WTAyakJn?=
 =?utf-8?B?dWhOdzRRTlNUZ2tlWWVjT1lPQmFuMDRhL1d4eVpNRjBwcUhWOG43YTBON0Fi?=
 =?utf-8?B?WklROUQxUGJQQzJzZjdZUUxpZjJRelkwVkloRThPZFgwV1VtektMRGVoMitN?=
 =?utf-8?B?NEUrK2FtbUVZTlRGdXNoTEQ5SC9FWk9ZdjUvRDJhUUwwTFlOakd4RWtnZngy?=
 =?utf-8?B?N2pNcmVrQTNUMVQwU2Y3d0pNN2wvUVhZZmlJVzRqejFKQmdtOEJoZlNlZTd4?=
 =?utf-8?B?MUJLd203WkFkS2lZc00wQXBUZ1oyb3RiOEE1VVhYNitHdklRdkRaSzZzRzlk?=
 =?utf-8?B?NVhjT0Z3REEvL0lsVHdVdG5Lb3VwQWRIRkFtbWpjNk5wa2k5d2t5MlBQaUNQ?=
 =?utf-8?B?cmt2YW1MWW1reFJ1bjVpQ2tyTjZ5bm9heDdCeWNJN2RTUUV1clRKWkNPdU8v?=
 =?utf-8?B?MzM3VW9obkhBMTUxK0hsMkd6OXZMd1M1ZnZxa0E4RHNwSzlIUTRlV0tFSzdu?=
 =?utf-8?B?d2hMdTlLRm4yRUtRUk8vQThlUzFmSjZ6N0J1QlRjT09LaS8xbmV0SER2Zkw4?=
 =?utf-8?B?Y1NRbkNKWGl0NjhrRmZURkFPVXdXZHdZZmlRSm1mQndPQ3J1S2RWQUxmL0J5?=
 =?utf-8?B?MUxTQ0hxQkZGbnZ6N3EwYjRldXNrNmZ1emJ6UG1uVGM0RHVCWjE3TW9NNy96?=
 =?utf-8?B?Zlh4ekt2cGxvMlIrUDZRMTZPR25iZklhWG95c3AzTEJ4aXdHbUJrbVZzN0RQ?=
 =?utf-8?B?VHo4T0FGbms5L2xFcWtkd0YyYURlTHAweXNnR1B6cVlBb3Q0b3pWdE1OcGlF?=
 =?utf-8?B?K3MvTUUrNmRhTGp1eHNzMFZXNExQUzZrajRWMjdXbnhyak9WbUhhdHRSM3pC?=
 =?utf-8?B?M2dqVll4eTVJaW5TbW54cmcwNUpJcjRiMzRzZG9wWk1iekg1VHZsd2c4VEpl?=
 =?utf-8?B?Z0VsbEFLbEpLdVVLSnVrOVhjRXF1OVlDZlg0QmNrZUUzQmFjdEF5bk45eGRE?=
 =?utf-8?B?WXl6QWlUbEZjQlNRQzJYUExiR09memhGeHl1NlA3LzRpajZ4RVBDYzUxeUcz?=
 =?utf-8?B?S0xsbGZLWnFXUGVlUGpkYUdrNnduaXU5UElZUTZmWDRPUHBsWGdQTzFqNzVQ?=
 =?utf-8?B?ZDdTRUorWWZPTEl6VUQ4Z1R2R043bXdYeWlIR2krY3VZR1M4OC9OY3lCdTFx?=
 =?utf-8?B?dzBXTkVrY3Z3Zm5RN0pjVW1iY2V5QldTcjJSNGFOMDdTWVFacjBtN3ZUaThi?=
 =?utf-8?B?ZWU3VUNOdTV1N05UNjVvUmZwYnE5aGRTV2E4aElFZERLcFlqTDV0ZytQYXA0?=
 =?utf-8?B?TnN1blhiRE0vOWhudFpUQ1VWZDFxTjQ0TERaT3RRUTRNVDRPZWExRm9ha1hs?=
 =?utf-8?B?MjNnVGpOaXJuME1TMFNLMnZpYy8yS1RUMjFheHVYcUc2T1hkTThmS0dQYzlY?=
 =?utf-8?B?eDNNVVY1b09WUlAyVmNjWm1NVGNVK00xUkNGeks0WEdqZ2E3bE9CQmdXZVlv?=
 =?utf-8?B?c3pJa3hRRlZtVjhRc0JMMWIrSWdGdTZvVGRWMkRXOWtTOUZEVEhEdFgzWjJq?=
 =?utf-8?B?WXZndWE4REk5bG9KalZEYnhiYVdoWU4rbEhXalZ3ZkNRZzREODZ4c3ZkOFd3?=
 =?utf-8?B?NWNPdzRUaDdMb0xQa0VuNjhGWmEvQ2J2dVBielErK082MjRacUEyK2ZKRGdE?=
 =?utf-8?B?UUJkL3MxMEVaL1dNNFJMcFYwWU8vU1N4ak5DQkZ6Sng4Y2xPbVFGRm1rWFpa?=
 =?utf-8?B?bURjcUF3RldlU0d0L0c2UTFDUmdCQW9LQnFQbU5zbWNpWDQ0SUQxT2dGMFZZ?=
 =?utf-8?B?V2tjazFmcndWN2lLUGtDMURrcUtxbTdkWVRWcnZEV1lXOEpnb2FweTJ4T296?=
 =?utf-8?B?SDloaVNHSnYrcmJGZm01cldPTGVoamQyRUFBblZkclhZbU5Xa3NvNkdQM0Zl?=
 =?utf-8?B?RkE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28ecd81-0767-4ee7-e175-08ddc7fe3326
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 02:27:55.2177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/qkc9BYyUGO65Nuz00Z287HxabvduvFL4/I8fmARQxwA0EilrFDT9WlB1D6GBGA78PVDuyC/zlsetbhtiep9vq5jH1yYYG1SuWeKkq1Ot4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6461

Hi Markus,
    Thanks for your advice.

On 2025/7/17 23:42, Markus Elfring wrote:
> [Some people who received this message don't often get email from markus.elfring@web.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> [ EXTERNAL EMAIL ]
> 
>> Use local variables struct regmap_config instread of global
> 
>              variable?                      instead?
> 
> 
>> variables. The goal of saving memory has been achieve.
> 
>                                                  achieved?
> 
> You may occasionally put more than 59 characters into text lines
> of such a change description.
> 
> 
> …
>> ---
>> Use local variables struct regmap_config instread of global
>> variables.
>> ---
>>   drivers/rtc/rtc-amlogic-a4.c | 14 +++++++-------
> …
> 
> Please avoid duplicate information here.
> 
> 
> Can a summary phrase like “Convert a global variable into a local one
> of aml_rtc_probe()” be more appropriate?
> 

Will do.

> Regards,
> Markus

