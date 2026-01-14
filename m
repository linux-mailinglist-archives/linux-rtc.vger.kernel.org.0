Return-Path: <linux-rtc+bounces-5750-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A67CED1FDE0
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 16:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 250D43014A21
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 15:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0C539C63C;
	Wed, 14 Jan 2026 15:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G+sO5VZv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013032.outbound.protection.outlook.com [40.93.201.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5183331AF25;
	Wed, 14 Jan 2026 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404912; cv=fail; b=rzEdo7VKaK6X25iOGI/ucJDs5b8N45mUcML8qGTz9c2orDn9miWuDQO/epo4ZnVObdWqbbCb/+AbVF1gfNmq8kohwsNBGwnqkHuLRM1XUkrJUYtALb9Nml7YJjmc2RBa+gWEV9dPiqQvTD9x/FoRoJO5S9WWGHOS5LaLuqfbM6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404912; c=relaxed/simple;
	bh=FKYEiqjkJtRt9s1i1z2mSn/GY6cA/SbV/68VlkrKH8c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hNnsqTfjE/1ykW1edaDJSWXl/U4e/Dyh6FdLfQ6/c0qtnrrYGnYojFIcLvzWsntOmgUFtajstlFeKOei5Dw+a4df4bh7g/+WOB4el45ntIJFUhGYN4JkQwRXNPYd8GqHdK/pKBdns+6Hlzze0OR0+5dcocy9ZaB0OneBC1m2Tk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G+sO5VZv; arc=fail smtp.client-ip=40.93.201.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elPsOACzkWNrdh/SVfSvbNvWiCedrHdLSpxUmRmzw7LSS7HdHkpl97Dj8FTe8vx50iAsBSywH9BLY0JNqWyreDlTH4AbQfSeSHq+dAJcATsT71vvlH2/085Ri+GqhQ6/v23SAK9n3/SwUsutsaZVUB3/bSeqXcQlnBX6Op9gYhRN547Hj5cArCSNCbKGocn44bQf5jgfwZE3kRa5NW3nUVAd1BEYwZjAjNrkXYXwIygHG2IU7qrhpEu23/b3B9b0ZtBiO/SCEZLv3wlCJJD6n/MGXw9IXen9rEw3pJ4UEgBV/JfVivkjbn2wfj8jZJ4se/nVbtquAeIUB+CnQQB/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKYEiqjkJtRt9s1i1z2mSn/GY6cA/SbV/68VlkrKH8c=;
 b=uYXyIx/Edrhrj7E3nqu/Gaa51ybGx9jckTcEGmQuN0e0KwaUiRbQuoFTLKtriMPcS0YazUzDSjTMhz8QvcKLRvkrVb1dgsgEGHMHiZqducNw7MUfAFv5gB42YEqIM5BatXEBvgMjJQYMLF24MhULz5Uud+Yu7lH9kQKgzQmJ9xoc3KUdr22FSmE8kIJOflq0RNFbjdN+cgTiIVSeaBGOk9KgxXNvZ+SR+1rTqAZZQ/bTtGu075iwL3Z00XhhJVF27Ihk2QkDzwEvRO/vD+tsaVHqYSUe9rSCBlh8pF+j0Nx+usKbJMgZ/KbpSWQ0/DRjA5Yo/4plTTj7gjFy1u3Vow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKYEiqjkJtRt9s1i1z2mSn/GY6cA/SbV/68VlkrKH8c=;
 b=G+sO5VZvxvHL43UnBlN7oiE2xkPx/zArfjCJKxr2C8urC44hSMvJPT1iZBEnZ/xVqLXtKilSTOo70TCMN87e6P8sGou4NVrZZjVJJYvhm4fImVSYz2V0U7h1vkQR9typ2IzaURRB5ly2BJzs+HOcWElDdAJ7rb33RfqEBSw5dBo=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by DM4PR12MB6277.namprd12.prod.outlook.com (2603:10b6:8:a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 15:35:08 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2%3]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 15:35:06 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Tomas Melin <tomas.melin@vaisala.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/5] rtc: zynqmp: correct frequency value
Thread-Topic: [PATCH v2 1/5] rtc: zynqmp: correct frequency value
Thread-Index: AQHcgKQ3Crd2i5LDp0iRVzOZiOI1wLVR1Tug
Date: Wed, 14 Jan 2026 15:35:06 +0000
Message-ID:
 <LV5PR12MB9804C7D43FBBBD8F34BBFD21928FA@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
 <20260108-zynqmp-rtc-updates-v2-1-864c161fa83d@vaisala.com>
In-Reply-To: <20260108-zynqmp-rtc-updates-v2-1-864c161fa83d@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-14T15:34:40.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|DM4PR12MB6277:EE_
x-ms-office365-filtering-correlation-id: cd2204bc-c336-4369-479d-08de53827e65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Ym9CQ0dxbExqN1ZpSk9RWUVvY0ZjVytZRlE5MWVYWllqZy9FcTY5TTFRUUF6?=
 =?utf-8?B?NnlYSXQzNjJqanY0Y0QzL0MwMVA3QjhzdGRNelZSODVnZjEvZ1JxMXdBMUY3?=
 =?utf-8?B?cjI1Y0FsU3A0d2pmSjZndE4zb0sxV2Z5RXRIT21pbkpvcWJCNGk2OWd4WTE5?=
 =?utf-8?B?eEZhOFJzbEZsck1PVXhVSUE0Qk9JcDZkb09NN0VhNmc4L0djbTBNVGlXYmJS?=
 =?utf-8?B?NWtvcm8wQ1UycDB5bkhheHBlbjJMS0U1TEdKMlBtRktXcHhTSnpFbkp2VjJW?=
 =?utf-8?B?WnlwTSsrZ2J1T05jc0Ixb1hDVGgzSWIvNjZJTXB0YTJyNGZSSXhwcnpvWitK?=
 =?utf-8?B?NnZtZ1pHeS84RHl5elJTYW5vUnh3aWJ3L0hRYWEwb2l4RVRyU1daNkxJbEdS?=
 =?utf-8?B?MGFUQ0k1N01YaWRNNjhDTWlwK2lJamRoZVJ0UFB0RDhRckl1RWJoZHpIT2lB?=
 =?utf-8?B?MTdsRU5HUCs4bE5MUkNibTdLLzRWckoyUXVYOUQ3elU5S1RaRHhhekpDMGdS?=
 =?utf-8?B?d1JmalAycmVtd3lpWnJkVXlHUUdJRHByMHloeU9GVDZvYW50ZmEvcG9XdEJJ?=
 =?utf-8?B?akVIWVZmaHIwSEZrS3BleFI2UUpKbmowdm9oNWNhbGRubHMwWWVYenpwalpT?=
 =?utf-8?B?RldkTXVGQ2JHZWRXWmlkcU8yVnh0cGhQakRBUWJLekVzWmtEQWlDQnVZUlNS?=
 =?utf-8?B?NllrTWp1bU9LNTJTKzNGN1NuTU4xRXRzQzZrL3ZvQzhsb2xXTDl4V25VdUNW?=
 =?utf-8?B?VVFDNi9UbmRjYVM3bEhEUTVLL2RmQkVWbUV5SVRnN2tTUXFZOXhISWZGWnRD?=
 =?utf-8?B?dm1Cd0NpbHhqSkt4aFVJVlV4VW5tV1dsYnM2dFVHUCt1OE9QZENWeDA1dndK?=
 =?utf-8?B?ZUV5RzZNaXRYZ2xMeWluTjhjd294bDNZWXNoSkJ1T2lhNUJhQ3B2V3dya0dv?=
 =?utf-8?B?bkRDVS9yUXIzT3phTk8xRlhnSGp3MkFnVE5ERDc4dDJCYWcxUU82eVVGRkpL?=
 =?utf-8?B?OW9USkNMWTVvWlhvaFd5ZFozR1NwNVJROWhlajFOWFZiWlpYaUQvQ2pCRXBr?=
 =?utf-8?B?eGd5MW5XY3RUMEJ2VmE3TllYZTBaUGV0YkRQMUM1UUsrdWVTUTdqS2xDN3d6?=
 =?utf-8?B?SmJVdUtxaU84enZpS3JpQXRrRUUxVjJtQ0cwajZKZHFQVmhGNEZGVjJaWGtI?=
 =?utf-8?B?YkxtcFFvTS8vc0JYWUNyZjRvZ0l0TjBGNURQOFdkSEZpWVJwODJnRmoxOUYz?=
 =?utf-8?B?b1c2T0JreFhMWm9QZkpOd0VuQlVvMTBtbVhCejBOY052Sy9lRTJ1bGNLYk5Y?=
 =?utf-8?B?Qk8vM25paGpFY2F4TnhsY0JrNWx6TEVxa3NaMVBBaThsSEE0dEVkZk5vNzgv?=
 =?utf-8?B?c3F5QnE2SFJPbzJQbFhBZ2NrRnMyUTU4cjI5MVl2U3V6dXU0R20zN0F6dE1x?=
 =?utf-8?B?c3VZR3d1WGxEZTRwdlZFa3FiSlExZVdoSnJFWWpKRjlNSjRGazBLYmowSE0y?=
 =?utf-8?B?aHc3TXNpMjg3TGIxWGxRWTBHeGgwQ1h1MEI5WDhzb1hrbU5sek96d3RRUmkw?=
 =?utf-8?B?U1BqWEJkekwzQlVxamNHdG84aHhiVHBFcmxyOWVWN0V2ZWF3MUZJa0JYbE9K?=
 =?utf-8?B?QXhwTFh0ZDc2UVVjMTJIVld6VENrb0cxZmthNDlUakg4MjQrajJHSmRaTGlF?=
 =?utf-8?B?V3lteDFhWXVYaEgvRXlHY1BzSkxaQ2l4T3Rnam9Vd2hiTGg3K3ZPQWErZU9B?=
 =?utf-8?B?V2ZXcHFkQ3R1Z1VJcWVZMnNmUXRwcXkxQVlGN3RHZlhQYXdDNExDQ1dtS3Iz?=
 =?utf-8?B?Nm11UVdvVEl3ZHRUODZma21rdENyMjV2QlBqckZUdXdFeXhzWFFpT25SNmZY?=
 =?utf-8?B?MHJtR1hoNHFVYm8xNEExOFZnVnJvcENNd2o2ZmdLRVU5SjBiTG9lMW5CbzJ3?=
 =?utf-8?B?c0pwYnNLZjdHbnc5L0ZYSlFjYXdvWHNKRmZRS3VaYStBdW05MVpaeis2b0Rs?=
 =?utf-8?B?YU9UbGVleVhmZ254NWxIZ0VyZEhGWGxvemNHckhEclo0b1pQN3NjZTVmbUl6?=
 =?utf-8?B?eEtlMXh6SDVFNEhQSzNzK3hRSisrYTBEUmFPMHJCRlV1NytnVyt5WXFUTlJI?=
 =?utf-8?B?TFdUWEhpZFc0M3Ezb1l1NWtEUkFRQTZoTXNUVUVPYnpFTGEyTjJoUEJPSnJ2?=
 =?utf-8?Q?eqUuRFE292YzhjbJNLSUvQY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M0M1bTFXZmNKYzJhWS9TTDhpTWpvOW9iTFAyelozdHZqRnp1RUJZTEJOOXR2?=
 =?utf-8?B?Zy93RlFadHZpelZsVUwrNlkzbFZEOFFwcCtmdFNYYnZ6YloyS2pleWRvZHAz?=
 =?utf-8?B?VFZFZG9sWFhtTmpyakhJQitDZ25xakUzODRjOFR4N0swY3o4NWhlMmVNQWow?=
 =?utf-8?B?L1JUN0o4VlFLR29jaDhGZENscmtKRHJKa1hqTG4wWGdaOXMvcTF1V0xuelpV?=
 =?utf-8?B?VlErRE5saDJka0xIZVB3OXpPZjZBUDlpQVIvQXc2WVFPWitQbTdCOEUrcXVE?=
 =?utf-8?B?ZVFGbi9lWFVyV1VKSkRZMmJkOWVnT0VSTHIyYkZrWTg5Vm5mQ2xtTlJSRERK?=
 =?utf-8?B?L0VLSUM3U3VDaFcvSmd1NFY0R1RZZHdhYVFVaXBrUG1DSUw1TjZJL3YvcTN2?=
 =?utf-8?B?NXBUYVY4OE90NXpqRDgvWVU2c2JVUjlSeDNXOVJiQ0JnRUdhSEQwRDVtMjc1?=
 =?utf-8?B?azhYSjRwSnJhRWpyQlJSODk4VGZtTVU5bE1RTGpzOVduSndDUlRpaDk4dzJq?=
 =?utf-8?B?NUZNbDFYTkFIWk5FbnRlOXBzK2s5bkJEcXVSMnZBeTdkSlhmUEwzZlR5RGpQ?=
 =?utf-8?B?TnkwQ28zS3ZUSFR0elFZTlNtanZQNE1JRExnR0o2UXVJLzdQRFBqL09KUTM5?=
 =?utf-8?B?aU45c3VybjJIZGpkamxoTkl0MWpqdkZKWWZ4a3ZRK3BzdkM2d2IxTXdyMVg5?=
 =?utf-8?B?MkxCbU5rM0lYTXhuOUx3Y1lmU0dkSnExZXZ3YkNEMXRSb0hXVmFhTHZvNFZy?=
 =?utf-8?B?T2VhVkJycHVLMzlLeEdXd3JXWUoxWjREbTF4alM3T0wrT1YrQmdsMnIrZHB1?=
 =?utf-8?B?cCtUamlONUNMRTlCbGdCS1JUNXFRWXZQd1B5Z09kZ0taTU9udUU5MHdNZnJ2?=
 =?utf-8?B?UFZCR2ZtTnZpZU04d3RLS2IrQTZGWFh6bmdCRUIwL211TmIwRE9vVXJjSXBF?=
 =?utf-8?B?TUo2aVJOUXpkc1hmMFA0Um1HdDdQVGFOUGpDZ1NkQ2hHSzUwZUxvTzJza1hq?=
 =?utf-8?B?QUhSQ2tVVmFsWGZURGkzc2hRdUh6cWFTV1dwQjVBYk5IOWVaR0p1TGFQa1NO?=
 =?utf-8?B?WlZwTkpzU2NQOEd1R0wyR3dnQWlZVGNKWWlPaFZ1ZFpNUFVSMkJQWXlGMHZZ?=
 =?utf-8?B?VWhGRVlrb1E0L2xNQW1WNDdyaHMzZ3FKREZEeXJQWlFpZ3VMeENkMCtwYTk3?=
 =?utf-8?B?YzcxNCtkWmkyMnZtNWQxMzNZbjNMNEJPWG9SbWtiaklpK3ZlQXdqdmtTY2tK?=
 =?utf-8?B?WVNOYkx4em0wekd3WlRaZVlTYjFPaUYvVERLVzFLb3FHeFVLMXd6dXRyaElt?=
 =?utf-8?B?YXZYM09HWjRZVWV1UXhtaHVhUHJQQnFXM1RUYUlvUlhVYytRK0c0bWVXakti?=
 =?utf-8?B?OEk1L3Nza21CbUpnSWdRYUU5eFRCZkM3R0VnVDQ0V3V6Y0l3cE11VXhML09Q?=
 =?utf-8?B?SWVqZkVqOFhuWWZ2RUduR2d0dXE0eUNsUVpscENoa2psQnhRUFZYcXJSSDFC?=
 =?utf-8?B?ZmxvZnczZmMrWGNMeWw1RG9ZUmtQeTdDenhBd1FMNFhVdERKOGZTK0d4WG1X?=
 =?utf-8?B?MkhFUnZjNWwzbmxxU1FGZTdIT0lleVRDRm9INDRaSnFPM1JHS29XTDRyN2Fr?=
 =?utf-8?B?ellPa2xYWEJ1TGZNUDdnZ01yQUg4NlhNYm5PckhrTnRaY3hvMDZiRlVtUHox?=
 =?utf-8?B?TmFUV1FsYXVtR3kyaGhiTFV6dForU1ZEZ3Q1UFRvbkN4Zmp2cHlmbjdaNHJD?=
 =?utf-8?B?SGZjQmlCSVpXS2wxek1xZTlJbWtINldrUmN2dXdWRDg4N3dJY2o4N3lqWk90?=
 =?utf-8?B?MXhQUHhqOWo0ZVduRm9Xdy9CeTBLeE55WFBmODdvVGdUSVFnUERJZG1WamdN?=
 =?utf-8?B?QzZkOHRVSXh1RnhpRHFadGVwbG9QVlo0ZmhjMFoyTXB6aDFFTmRQY2dHeHBX?=
 =?utf-8?B?L0gvZWRoTW5Ldml4TC9kVkZMMUh5MnlxdU9SZmZncFJhNjh4ZElTbFpiWm96?=
 =?utf-8?B?N0Z3UFhxVEliMU9HU2w2bmJWWEt1Q2t0amFQMVA4dFlUaXFrMWRTblBzMGJs?=
 =?utf-8?B?UjNmdEJXcTZZKy8xejE1Sk9vZmNnQnpVbTdyV1g0QVhZS3JLQWVPUlhUT0Er?=
 =?utf-8?B?djQwMStNdHRYc1lNU3ZCYSs5bC8rZmZ5NUUvenUrNzliQ0hvYmtuQU5ZMXoz?=
 =?utf-8?B?T2xHS1BKaWJDOU5OVk5wTW1XK2F5dWJLclZpbjlqaHRUL2VRWDF6TWQrVXRF?=
 =?utf-8?B?ZG5TSnVzUEN5bnhMdnIrWlAyRm1BRVBORWRDa0NLc2xoeG02cTZ1M0hTMDNM?=
 =?utf-8?Q?f3uONggDMfI9iwGZD7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2204bc-c336-4369-479d-08de53827e65
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 15:35:06.4097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C0qaZnWU09moD9cdESNfeREw/YN8zagY9UdPDyk4rh7+AZGnypqya+ZEQvtZBKSe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6277

W1B1YmxpY10NCg0KUmV2aWV3ZWQtYnk6IEhhcmluaSBUIDxoYXJpbmkudEBhbWQuY29tPg0KDQpU
aGFua3MsDQpIYXJpbmkgVA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFRvbWFzIE1lbGluIDx0b21hcy5tZWxpbkB2YWlzYWxhLmNvbT4NCj4gU2VudDogVGh1cnNkYXks
IEphbnVhcnkgOCwgMjAyNiA2OjIxIFBNDQo+IFRvOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFu
ZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+OyBTaW1laywgTWljaGFsDQo+IDxtaWNoYWwuc2ltZWtA
YW1kLmNvbT4NCj4gQ2M6IGxpbnV4LXJ0Y0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IFRvbWFzIE1lbGluIDx0b21hcy5tZWxpbkB2YWlzYWxhLmNvbT4NCj4gU3ViamVjdDogW1BBVENI
IHYyIDEvNV0gcnRjOiB6eW5xbXA6IGNvcnJlY3QgZnJlcXVlbmN5IHZhbHVlDQo+DQo+IENhdXRp
b246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2Ug
cHJvcGVyDQo+IGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5r
cywgb3IgcmVzcG9uZGluZy4NCj4NCj4NCj4gRml4IGNhbGlicmF0aW9uIHZhbHVlIGluIGNhc2Ug
YSBjbG9jayByZWZlcmVuY2UgaXMgcHJvdmlkZWQuDQo+IFRoZSBhY3R1YWwgY2FsaWJyYXRpb24g
dmFsdWUgd3JpdHRlbiBpbnRvIHJlZ2lzdGVyIGlzIGZyZXF1ZW5jeSAtIDEuDQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IFRvbWFzIE1lbGluIDx0b21hcy5tZWxpbkB2YWlzYWxhLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL3J0Yy9ydGMtenlucW1wLmMgfCAzICsrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5j
IGIvZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jIGluZGV4DQo+IDNiYWEyYjQ4MWQ5ZjIwMDg3NTAw
NDYwMDUyODNiOThhMGQ1NDZjNWMuLjg1NmJjMTY3OGU3ZDMxMTQ0ZjMyMGFlDQo+IDlmNzVmYzU4
Yzc0MmEyYTY0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3J0Yy9ydGMtenlucW1wLmMNCj4gKysr
IGIvZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jDQo+IEBAIC0zNDUsNyArMzQ1LDEwIEBAIHN0YXRp
YyBpbnQgeGxueF9ydGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiAqcGRldikNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ4cnRjZGV2LT5mcmVx
KTsNCj4gICAgICAgICAgICAgICAgIGlmIChyZXQpDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
IHhydGNkZXYtPmZyZXEgPSBSVENfQ0FMSUJfREVGOw0KPiArICAgICAgIH0gZWxzZSB7DQo+ICsg
ICAgICAgICAgICAgICB4cnRjZGV2LT5mcmVxLS07DQo+ICAgICAgICAgfQ0KPiArDQo+ICAgICAg
ICAgcmV0ID0gcmVhZGwoeHJ0Y2Rldi0+cmVnX2Jhc2UgKyBSVENfQ0FMSUJfUkQpOw0KPiAgICAg
ICAgIGlmICghcmV0KQ0KPiAgICAgICAgICAgICAgICAgd3JpdGVsKHhydGNkZXYtPmZyZXEsICh4
cnRjZGV2LT5yZWdfYmFzZSArIFJUQ19DQUxJQl9XUikpOw0KPg0KPiAtLQ0KPiAyLjQ3LjMNCj4N
Cg0K

