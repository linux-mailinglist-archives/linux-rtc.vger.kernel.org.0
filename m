Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D25F82C816C
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Nov 2020 10:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgK3Jwc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 30 Nov 2020 04:52:32 -0500
Received: from mail-db8eur05on2116.outbound.protection.outlook.com ([40.107.20.116]:44377
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727272AbgK3Jwc (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 30 Nov 2020 04:52:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3K/B59gnwcAnWQ0PeHZV6TBKTbizuXmjHL57A+a8/+AlPTNMXO11lsFxHyG7QJaz/GshPROW2f4bzUQtBnfk2rG8dT2yI7FX8R1FKvx8glJ/brAjTWfaLI6cVty0yWnS/vPIdJVlH7IcRG3cPZKvt/dSAhY50qyH0UhvEDnVOMDgHNzjVeiwgKg6iDBWn9I/7maD0vHVT3GIUyCNiN2HuPqp+qNtf9r7GdF43IOgZQcviH7K3CBZ8+ADZ+BiebpdtE9dCDdxOQVCsr890DGrPWvLuR+b/qKfpooCyxekmPADN4RruQ1SFtAgXodxOy7RzthN0mUoyfoF4+jvptSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSgrDmizTWPztaU8a5Pyvxpnt/tv8ajo2X9dW+yOgm0=;
 b=k4nb54IyQ3CBdz1nFaT6Vw5N1wkKYiLj7AHuQEnPhbn8IKT3FBhbbSgBcBJMQ8glj/6w57N2F4VAhOJZsmD1DbmRr8KLxIKYJZjy1zf6lJY01MTr3WAgCqcuyyCzvDZsdHfqPhacv36qHq/x58h4D+CDxRfQ5EliRBhIcp0bGU8NIWHpqCo1XSRyXHBlB5SnZVDOqy7rIOfp9vbNnGzsAXNzdLyxyEvnWgxVloenGoVJ3aMLRmKfOt9ucOHXj1IrxwlMBsj/p9FvG6R4ibUpjKNxZwgU/nHZ7aZCie2n/LWOUN1LExK9iWeAVnPO7gPJLdJAwVaHc6El6pB+GjnF9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSgrDmizTWPztaU8a5Pyvxpnt/tv8ajo2X9dW+yOgm0=;
 b=O4X4DcRmdRakDEffsNuLEcol36sNmZ2J0or19nU+Cy3omlCa86mMyZe1AUpzRtuNcJ3VXhK7U0fRAog2pZKfPGIuY2fn28vIbG3u8Saaf+Z5A9JujB//9CNh0TlXoNzzheoaDxHQKusJb6PCRQOMelxLw64CgM6hvvABOKyzvcw=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM8PR10MB4132.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1ef::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 09:51:43 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 09:51:43 +0000
Subject: Re: [PATCH 0/2] rtc: pcf2127: only use watchdog when explicitly
 available
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-rtc@vger.kernel.org, a.zummo@towertech.it,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        kernel@pengutronix.de, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
References: <20200924074715.GT9675@piout.net>
 <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <c82fe7a9-0a5a-fd70-ae3d-6fdc5fca5a9a@prevas.dk>
Date:   Mon, 30 Nov 2020 10:51:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM6PR04CA0002.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::15) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.115.188) by AM6PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:20b:92::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 09:51:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86d23d89-34d4-4894-9cff-08d895158abd
X-MS-TrafficTypeDiagnostic: AM8PR10MB4132:
X-Microsoft-Antispam-PRVS: <AM8PR10MB41327D9603F516D3A2C77AFD93F50@AM8PR10MB4132.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zyhQ1+qDbMEqZaNq5WdGJju3ggjtyIldrWHSV9z41yusf8/+yTF3gsrfs7dyQNeKFcE/d22sFGlvMRRZ21JLzu5jTO5KDxH7LjdbVXETZzoYBQFgtMy8NiK40kjGAlqR8DXoe40h0QKVx/OP49xp5hLbkL0u4oGq/PPmkMmdSJ/zbn54PKMXUUDyxDxD0AWkOfmbGUeCBJ1YNWEnYnmAK6V99utzIyPuvSRm4Nwnlc/UsYumiaftZMWIhNgrzIU483gEpMbaXx36zxEJtEst94T1aOj34vCE7+/b4tM/Y9sNW6hZDAnBGJBYm4lB+9o6UsAmzP6e7O1ZY7zr/t+rKSi4N9GBzglDNWbgYMHCqJw46NIdtu47ObTdF6wnxAV7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39840400004)(376002)(346002)(396003)(136003)(366004)(16576012)(956004)(2616005)(7416002)(44832011)(26005)(4744005)(5660300002)(316002)(52116002)(186003)(8676002)(66946007)(31686004)(8976002)(66556008)(66476007)(54906003)(4326008)(36756003)(8936002)(478600001)(2906002)(16526019)(6486002)(110136005)(31696002)(86362001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QitkTitmOW8yanlmdnNJTHRBdWNmKzdibWRFU0xTRnhhcGVyVW8zWk5xRXFr?=
 =?utf-8?B?YjhRSWFMallRZkU5OHdkMkcrT0xmOW0rb0tHSXFtVUNVZkQ4dVJqZzRXaEcr?=
 =?utf-8?B?eDM0WWpiQm5BMnh3RmR1b0FqakN1MlU0RUo1cGk1dVdaRCtIaXJXL0crY2Fn?=
 =?utf-8?B?YnlvWlBINGIzWWVVLzBKZTN3azJsK2N5Vk9BMjN6ZWo0LzRENWo5clBLS0Vl?=
 =?utf-8?B?SmlGTU1pUTJoMkNLUTRIWklnYzR0K1p1RlRVMFBCOGhyMENpTDZJQlFCUysy?=
 =?utf-8?B?aXN1WGJ2NllnYyt5ZW1veGd3ZUwxTm1MT001RTlpU1hiLzBsUlgxdUZ4YUEr?=
 =?utf-8?B?RTM3dVNTeUdodGVFODNrK2xOOG5YSjNFNkYrVkljTnVpMDlhYmVpTmFyQ2FZ?=
 =?utf-8?B?bkQ4TlFPbFNaMU5iUnd3Vk1NU2VpZnNWWlVDSU8vWXF3aUhCNzlQT2pXQ1BB?=
 =?utf-8?B?cFpYZEJmVjFRZ0dTRFNqL29GVjF6QjhxZlh6WS91K2U2MEREYWlyMzUrYVRo?=
 =?utf-8?B?ZDhYb2pwWnRFUGNBRWFHa1ozS1puZ3grbk45NW1YZlZRcVI4cG00Vmhsa2di?=
 =?utf-8?B?eDM5eXJkd1pBQjl5R1FkUEN0d2d5ZUh0K3I0aFppOWRCeFdkTXBoRGFxaUxK?=
 =?utf-8?B?RzFXY2RXZXB1cnVzSTVPc2gyK2pMTUM1TndneUo5bmJKYXFMa0hzbU1WY1pr?=
 =?utf-8?B?VmRNQkM3RHg4QjNLMVZUM2ZhcHFnVEtBVytHWHJ2aXpTRjdnaDNxUlpWS1Bm?=
 =?utf-8?B?RHA3aURHRXJMLzExb3pYUlJmL1FMZDcxWm1wN1gydHhtYjIzc1pvQmxWcEI5?=
 =?utf-8?B?aUYreS95UmhHc1JJaVU4UThKTm9QTzBJMDFQL3hRVGplWmJ6V0t6UFVZaENp?=
 =?utf-8?B?VDVwVmMyRW0yOFJpN1Z6MGk0anlCTXlyUTg1cDFnYWlxaU1yMnJDWTIzeEFs?=
 =?utf-8?B?QmRlYlVMT01pd0xwblpNRUZrNGtOVFI5cHNEaDhHL3o5RDEvT0hoSW5wTnRW?=
 =?utf-8?B?c1ptdU4wRGJpOWNNSFRvUGZMdHJaRnlhdmo4OUdoeVJkOUNYbm82L05ZWnUz?=
 =?utf-8?B?UkY4WVo5MStrRVVHcUIxM1l3VnhvNmJ3VnhaeVdlSUFlKyt5Uy9vTmZnUkVY?=
 =?utf-8?B?c29PQnhaVmNCWW5CNEgza003SEQ1VzBrT0NwSU0rVUh6Y0hGek9iTlJKZ3NH?=
 =?utf-8?B?Q3JVU0VPK3VDYlJCdVEvczdFMHZWNE5pR0xpeXRjWGIyL0hRZHZ3WkkwRGpF?=
 =?utf-8?B?b2k5c0xQSlJqaWV0WUcxUGdOdmZ3VmFSblpTZ3c4RkJJOVFKaDhabTNlZG00?=
 =?utf-8?Q?KlowvrSMb6Lwes31Oy+PcHf86/dqVMwPeL?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d23d89-34d4-4894-9cff-08d895158abd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 09:51:43.3745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSm3AAjuVV9KOrjatHdMxiMC7zSCkpR5xZtbb9p5IoxfOAeNGQYoT5lt5fIx1SW1DBuUrWCHoYc4hCMzuk0zxSfoM0WaOE9kgfki7I99U4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4132
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 24/09/2020 12.52, Uwe Kleine-König wrote:
> Hello,
> 
> now that there are two people stumbling over the pcf2127 driver
> providing a non-functional watchdog device, here comes an RFC patch to
> address this.

I just want to add a "me too" here, as I'm also now affected by the
pcf2127 exposing a watchdog device (1) it didn't use to (affecting what
/dev/watchdog0 means) and (2) is not actually hooked up in hardware.

So can we please move forward with adding the has-watchdog opt-in DT
property so existing boards will not be affected?

Thanks,
Rasmus
