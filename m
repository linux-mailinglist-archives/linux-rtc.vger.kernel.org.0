Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE2A2B6907
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Nov 2020 16:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgKQPsd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 10:48:33 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:56398 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgKQPsd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Nov 2020 10:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605628112; x=1637164112;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=vt6n/uRSEqn2qkGSaMpqYP02CGx9gVYSoDzaLJ0GRuo=;
  b=feDAmP4y+ZYOnB1VHWIUanSw5+DAAtsERDGyYV4W3SOkxEF7p8XGCieN
   xnOoqekoOpu1pcXV/bhpXQCfmdNwtgTVS+3oP2nSzzteDrzHDQpvZNhq/
   cvxM/s9QVzIH9iedoULsTjf0XAuc57TNXzGYBOP5Uns62Pv7rpCk2O4mT
   STydKsdAgaaiwVbuW8jWVMC3i16kl0cwRldKyZkx/jUwB4KQNfCIzvBHH
   Y1kvQjugdXSj5EE6r/KoFhl02008aV4UNzyewgZEgs1TykaX+Ef25CPBv
   6PJnERk3u60VtYSavTwjMXVZo4A17I2EMulAUwV7lyXh16D6mBD6bmV+1
   A==;
IronPort-SDR: TRHlD71kxqV8Xiu1ior8khpmqv5NCwMBdz9m/rmlEHlKBUvG1q8J98MYt9+YL19L2/cL+muXyr
 ytmKGY5Bv45HxLMf16JK5emoZ2Bh+afPePhVsIYalVqDCV2s4gmGRn16t/yzdmB42dfFmbuJtM
 W3/0GO1DkXtMv9gayamf0ZcB+mfQ4F+53Y6JOw39Wv2wStrpkhTKpoTFKtbqan/Nu7G66SiD0x
 7Ecod1NCbn2wo94egG2ktDVzrk8YSZW6IXKimxpcg62QskEmcidNOSicK6WE8o3YcrPpoQ6gQX
 k/w=
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="98769453"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Nov 2020 08:48:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 17 Nov 2020 08:48:31 -0700
Received: from [10.171.246.83] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Tue, 17 Nov 2020 08:48:29 -0700
Subject: Re: [PATCH] rtc: at91rm9200: Add sam9x60 compatible
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
CC:     <linux-rtc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20201117133920.1229679-1-alexandre.belloni@bootlin.com>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <1c5f0d70-93f5-0285-66df-43a9f3611e90@microchip.com>
Date:   Tue, 17 Nov 2020 16:48:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201117133920.1229679-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 17/11/2020 at 14:39, Alexandre Belloni wrote:
> Handle the sam9x60 RTC. While it can work with the at91sam9x5 fallback, it
> has crystal correction support and doesn't need to shadow IMR.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   drivers/rtc/rtc-at91rm9200.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
> index 1eea187d9850..da24e68adcca 100644
> --- a/drivers/rtc/rtc-at91rm9200.c
> +++ b/drivers/rtc/rtc-at91rm9200.c
> @@ -437,6 +437,9 @@ static const struct of_device_id at91_rtc_dt_ids[] = {
>          }, {
>                  .compatible = "atmel,sama5d2-rtc",
>                  .data = &sama5d4_config,
> +       }, {
> +               .compatible = "microchip,sam9x60-rtc",
> +               .data = &sama5d4_config,
>          }, {
>                  /* sentinel */
>          }
> --
> 2.28.0
> 


-- 
Nicolas Ferre
