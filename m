Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2901C6315
	for <lists+linux-rtc@lfdr.de>; Tue,  5 May 2020 23:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729250AbgEEVaY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 May 2020 17:30:24 -0400
Received: from mail-eopbgr00125.outbound.protection.outlook.com ([40.107.0.125]:55104
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728853AbgEEVaX (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 5 May 2020 17:30:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3oXONrU+aihIXIKD5URuYEbO30Ph7aHHLH6m3t5AqD6ERHwfSabqtutR/AxnDDwhafP3k4mJZ50xlem1c36961e5AMJ3+U76t3havFWb3ZMjw0fmnWMkXZVAweyfyB15NbB0N0OmKi3pbqvuF8iCkox+TVCiveu50ElfJdqgX0TsC6i9UR+Bfr6omOp0HJvRcf2uXrvaps5v+IR+U0HAnx2tkkNMySyTjWETCQhpbo4ate78rNzj32RuWGAILz0pVF9PNnAZftfM2A214u37G6C3/ktAqdvpS2/X0frm1dEsak3AXT61DQ8UhTUdB139aJ/zUyDf16DXYw72LLzSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DOJUdoxG92qUWc5t3gWvqwdP0U/JrCONTeZMCny3sg=;
 b=EvoA4RNchdYIkH507x50Af5WsUf7l9vojebl0TnBctivxWLXDIMuIWYO+JYA1sDBFiS9uqU8ZDMi/7eoZIpSAYlyNr8GXeSxsigdYKEfWyRasmq41DjS0rIQbqnibO6W+GZRcbBsX9wro16DzcA1MlcuA79Rby7lwffOypxbmTUGiH3rldggDIIJE89MPTTnrFOyEPNTOZvX6VU+pU+IIseHhES34yl6MHv43o7bqT3/v2lxGwbHhtkpJPxte5ei2rCr7oFA5Zf5LxGx8hdPcHh1xo5nsVutZ63ITXD1Q7NerX0J+xaMxlI97AKY/1brg8iB6U65ghAvHk1tJimQpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DOJUdoxG92qUWc5t3gWvqwdP0U/JrCONTeZMCny3sg=;
 b=k6HZMgiHD0gUJvFg6nJ9pEdI9qz1d+JNHCmsnvYjAMfydeNNASFemvFtrakSbsix0lXW0Dqn9ttdTbvCEnJbN6CBOovThLtt43JYyoJY5kuLcQOReE51iWFhwfZWqwgvatJbOacnW+7knEQaAN5umkBU8fn9QwCVTxN3S64LHTY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=prevas.dk;
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:e1::21)
 by VI1PR10MB2189.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:80::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Tue, 5 May
 2020 21:30:19 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa]) by VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa%7]) with mapi id 15.20.2958.030; Tue, 5 May 2020
 21:30:19 +0000
Subject: Re: [PATCH 5/5] rtc: pcf2127: report battery switch over
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     =?UTF-8?Q?Per_N=c3=b8rgaard_Christensen?= 
        <per.christensen@prevas.dk>, linux-kernel@vger.kernel.org
References: <20200505201310.255145-1-alexandre.belloni@bootlin.com>
 <20200505201310.255145-5-alexandre.belloni@bootlin.com>
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <e4910679-4453-f753-2c3e-4c93fd755b39@prevas.dk>
Date:   Tue, 5 May 2020 23:30:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200505201310.255145-5-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0027.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::15) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.116.45) by AM6PR08CA0027.eurprd08.prod.outlook.com (2603:10a6:20b:c0::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend Transport; Tue, 5 May 2020 21:30:19 +0000
X-Originating-IP: [5.186.116.45]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c43ba18e-1a59-4b29-a1fd-08d7f13b82b0
X-MS-TrafficTypeDiagnostic: VI1PR10MB2189:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR10MB2189B3AD1DE15087B8EA020993A70@VI1PR10MB2189.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0394259C80
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5iEI2AHpW6uxAZr9pYWse7O+W33grWprt5zRFWC/Yn89OiF6o0554THhjF3LpYGIGSZvjp0xiuYBO5hKhccImGoMaUOCXPHi4fbD5GIq2LQ9vMmnZ6+tRPg5tUeMrVHIgGj6QoMHpw/qTH/musTR/CwYnwM/vFwZNfspgcIhrO1HuWd39Jcb/X18Kt5GujEqKZ1E+F552EwpHVPF1bfFQNRAFBPvuVEZAK8sgg+neatP25tQup0O9fgF+mxx9dUKEpEo9XUCOXguT/WRM7R1ASP7YQPdXMIvUudgs6HMm8fG4owe73nmqpQQOYleGNhA0ULxciog65tDAjPyzt/fWzuWDEj9XgIOdnrUKRvOXJi9Vnf5Yiu9hcecezQVzCbUPqzdbaD7az0/Wo+1WxsYdyZ8p1vwHXzH8+7dzk54ErwM4LxrBESC3Wf5FXd+hAD2D+lwoihQ9JIxJ9HlfrJvVj6LbkbVD6IWNbEVydv9tUEvxXlGncrfGUR2HM60gNtV7BnLIzJJxZjcL3S9pIo+PfIMlfLiimp4wT2uhiJTlmxVAAZJlVOh+bxlC7wqVgMU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(366004)(33430700001)(2906002)(16576012)(8976002)(8936002)(8676002)(26005)(16526019)(186003)(31686004)(52116002)(33440700001)(36756003)(86362001)(66946007)(6486002)(66556008)(66476007)(5660300002)(4326008)(44832011)(31696002)(956004)(498600001)(2616005)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: AUrrj47CYEEnizxH6TI631clTnqWM80AMQGt2kee99zmhcrS1+urjnMk8jmQrVhYkB281HxYquTEQ0mKp8iHfKbXNHsZbmcuVIe3SySTpqEL84muWqhe/ZOvPOLNs6zgwRQKHFWTCluTRufWm3KAI86ryHn6O4z4nEl4myvfgB70w7yLDU7BrB4RiQBj6K5lyT7aIoggvprrnw3dOQtmLa/YvMsADCpS6kg3DpK3Z6D7LjQZW9MkUjzIlZzR65fTMYQfdrIDtJv3IsQtnlJ9wv+4Y02VDOAe1E4z14EWazMl96IYCtJraxNA7dKJe+uFBIt2K9A/QIwt6WwvQKlFz5lJVTP+7Eia7cq8E9tzIgp/c7a55VPDPvWzJ06orXRmxKkAbde859mg93dSNHTkVQQb3vrd4BY6yxT3zd9728JToIuhK1CO9VtacceGqGx/e9LE5xqh5EsNaEMNZbhI/XRjBy33HvIwKwNj2xJxW3gSkOpIeI1obBlLyG0TotzQZKHknzoMr0kZZcyijQMvVP/HlxGUmInT/mWxROBclDGq5m9+KCRBjG7Xl4mRx/i+imXzDIIS7jJrUiuLOqlKWWxhK2X4SRdQVZuGKpOlwIm54CZxbs8QeBisaLVQuzJcpYmNntYe9ssLsRTOWou0dv6czJkIpRQAgVCX1RCQ8AHPnW9vbtL6uXDZPSxY4Hj+fL90e7GR7DoysNFmkGzD2d9WtKUQuS9mELndoy+EG+1uDq5ZrFCL7KpsZ5LAP69+l8/HT3NfEz6GNRwmq/n+bNoToWeSev0D5VH4Ph+r0xU=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: c43ba18e-1a59-4b29-a1fd-08d7f13b82b0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2020 21:30:19.5082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrIsL22N8NRbmwL8YDkgyT5xRvfjz6rte4QGLE/7Z8d9k/366+VIBt2g6rX5gDCKoCuLBNoSj0NiZmSM7oc97OVjmlyKqYJgMs1QdyyelDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2189
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/05/2020 22.13, Alexandre Belloni wrote:
> Add support for the RTC_VL_BACKUP_SWITCH flag to report battery switch over
> events.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-pcf2127.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 039078029bd4..967de68e1b03 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -188,18 +188,27 @@ static int pcf2127_rtc_ioctl(struct device *dev,
>  				unsigned int cmd, unsigned long arg)
>  {
>  	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> -	int touser;
> +	int val, touser = 0;
>  	int ret;
>  
>  	switch (cmd) {
>  	case RTC_VL_READ:
> -		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &touser);
> +		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &val);
>  		if (ret)
>  			return ret;
>  
> -		touser = touser & PCF2127_BIT_CTRL3_BLF ? RTC_VL_BACKUP_LOW : 0;
> +		if (val & PCF2127_BIT_CTRL3_BLF)
> +			touser = RTC_VL_BACKUP_LOW;
> +
> +		if (val & PCF2127_BIT_CTRL3_BF)
> +			touser |= RTC_VL_BACKUP_SWITCH;

I think it's a bit easier to read if you use |= in both cases.

Re patch 3, one saves a little .text by eliding the ioctl function when,
as you say, it cannot be called anyway. No strong opinion either way, I
don't think anybody actually builds without CONFIG_RTC_INTF_DEV, but
those that do are probably the ones that care about having a tiny vmlinux.

Other than that, the series looks good to me.

Thanks,
Rasmus
