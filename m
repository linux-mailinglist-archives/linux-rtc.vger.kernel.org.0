Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D203BFAA1
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jul 2021 14:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbhGHMwb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 8 Jul 2021 08:52:31 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:48273 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbhGHMwa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 8 Jul 2021 08:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1625748589; x=1657284589;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=TpUIsgX7FzyBu6O5stiMZJI9xDc9QQdxk5e91Y1Wa2w=;
  b=ZjI1j1E5hkxKkr8unXmeUEmFmciUkNbpxtKw/8GiHXUwUwGMjMelpJn3
   vF4wOTIEOm/SpbXY2gLjnk/ZW25m6ycrRvY0RD2xurT09UsWre7uf5yzT
   +rWwVsKoIxlIHmE4Wzy0Xm3IJ6pnRgBKvL5biiG0CAJwLszp2HwOYAd9U
   MhhIGf5e22SU2XVrFYyK3l2G4J9MAwnEDjLxvciXVSGzDv/Uy1Wb1Nwko
   XvotswXGFmBsIZVCiitMZbIsiGx01/HtPTo8v9SliVHYCIxD8LsuGUv04
   MMQ+662ByDRWzZQ4wNdw98KLOCXcBdDyletCBYKho1yfmiL0zf/DwJzNu
   w==;
IronPort-SDR: DUiEhDLxPMuJbun3Z9etEEdP5/84TRUahxLatC0TN19b1VOzSdnI1MuWcXmkAAC/frvHIk8b7Z
 N+zNHwY2W7eEBCPdoMdNZ0KQir7FRWMj1Ju9JZx35+Uf5mb3SYtQ63/9J+AE2T4Q6Q73pVmta2
 tzjuWgYffblNHyFt2/fx1Mp4dgdi+DD3o81zLiRnjwWX/l9p1NUxmfBNeR78YCZA8rciYGaQ9e
 +5N59ykgJ65STrlDn7i+9O1Pm7ZQSfCcvfRqQfL6r7IIA70RD9zI5htS/8b+6wWaE7H4Chyyul
 skI=
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="128098183"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jul 2021 05:49:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 05:49:48 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 8 Jul 2021 05:49:47 -0700
Subject: Re: [PATCH] rtc: at91sam9: Remove unnecessary offset variable checks
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <linux-rtc@vger.kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
References: <20210708051340.341345-1-nobuhiro1.iwamatsu@toshiba.co.jp>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <ad2606b2-d1b4-7fc9-ed4c-077e31a34aa1@microchip.com>
Date:   Thu, 8 Jul 2021 14:49:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708051340.341345-1-nobuhiro1.iwamatsu@toshiba.co.jp>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/07/2021 at 07:13, Nobuhiro Iwamatsu wrote:
> The offset variable is checked by at91_rtc_readalarm(), but this check
> is unnecessary because the previous check knew that the value of this
> variable was not 0.
> This removes that unnecessary offset variable checks.
> 
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>   drivers/rtc/rtc-at91sam9.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
> index 2216be429ab727..b7b5ea1a4e6726 100644
> --- a/drivers/rtc/rtc-at91sam9.c
> +++ b/drivers/rtc/rtc-at91sam9.c
> @@ -184,7 +184,7 @@ static int at91_rtc_readalarm(struct device *dev, struct rtc_wkalrm *alrm)
>                  return -EILSEQ;
> 
>          memset(alrm, 0, sizeof(*alrm));
> -       if (alarm != ALARM_DISABLED && offset != 0) {
> +       if (alarm != ALARM_DISABLED) {
>                  rtc_time64_to_tm(offset + alarm, tm);
> 
>                  dev_dbg(dev, "%s: %ptR\n", __func__, tm);
> --
> 2.31.1
> 


-- 
Nicolas Ferre
