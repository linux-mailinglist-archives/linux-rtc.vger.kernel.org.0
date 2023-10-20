Return-Path: <linux-rtc+bounces-116-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 595C77D0FE0
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Oct 2023 14:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6057280EAF
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Oct 2023 12:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD3E12E5E;
	Fri, 20 Oct 2023 12:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="eg5kLCVl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681BB8F5A
	for <linux-rtc@vger.kernel.org>; Fri, 20 Oct 2023 12:47:31 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D7291;
	Fri, 20 Oct 2023 05:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1697806050; x=1729342050;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aXXmqAMTaJ9llNy54dgQduDOBZlBWnWwsrEn2k0KPf8=;
  b=eg5kLCVlCOr3dgpo9WjJh9IIJFJmumbk9VYowJyA9dkPsuUZFeFwEeYl
   2yk1xe4OkVjiZJSAN3AfRJ6dMc9p6Pi+iUC7wKlwx3Red9f4Hasc5K93G
   j7MOZ+btxuN3lc/2lZeSV0L+pVmb9K4N7EAcJpNSCGv49b1UZrkTwAs4j
   PjPbpqNepjcwsZi3u5p/SE5lVX5/ZVxafCIwW5I7m2gVWba8/MsBxmmjs
   wnJbZKGXdw324vzB6x+WtQMNfKuP6KHgR8nVXNJHRccs+e449RBMgMg0r
   83Sj/ieO7YiwULP+eSe3Drk630ECNK+9X3n9yR7aStY2G4VUvYNWMimrk
   w==;
X-CSE-ConnectionGUID: j5zftE2fQGeYR+MQxGrMGg==
X-CSE-MsgGUID: iEkiYNzOQ1W2SQf1bIdoew==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="10428489"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Oct 2023 05:47:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 20 Oct 2023 05:47:11 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 20 Oct 2023 05:47:10 -0700
Message-ID: <c339d334-5fe4-4c1a-81ee-42882d93f3e5@microchip.com>
Date: Fri, 20 Oct 2023 14:46:43 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: at91rm9200: annotate at91_rtc_remove with __exit
 again
Content-Language: en-US, fr-FR
To: <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: kernel test robot <lkp@intel.com>, <linux-rtc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20231016041816.246426-1-alexandre.belloni@bootlin.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20231016041816.246426-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 at 06:18, alexandre.belloni@bootlin.com wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> Without __exit, having the driver as a builtin after dropping the __exit
> annotation results in:
> 
>>> drivers/rtc/rtc-at91rm9200.c:561:13: warning: 'at91_rtc_remove' defined but not used [-Wunused-function]
>       561 | static void at91_rtc_remove(struct platform_device *pdev)
>           |             ^~~~~~~~~~~~~~~
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310160705.vlElNOGb-lkp@intel.com/
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Thanks Alexandre, best regards,
   Nicolas

> ---
>   drivers/rtc/rtc-at91rm9200.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
> index 3f5ff9867c02..c16fe711a0d9 100644
> --- a/drivers/rtc/rtc-at91rm9200.c
> +++ b/drivers/rtc/rtc-at91rm9200.c
> @@ -558,7 +558,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
>   /*
>    * Disable and remove the RTC driver
>    */
> -static void at91_rtc_remove(struct platform_device *pdev)
> +static void __exit at91_rtc_remove(struct platform_device *pdev)
>   {
>          /* Disable all interrupts */
>          at91_rtc_write_idr(AT91_RTC_ACKUPD | AT91_RTC_ALARM |
> --
> 2.41.0
> 


