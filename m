Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD8B2ED150
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Jan 2021 15:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728572AbhAGODS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 Jan 2021 09:03:18 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:55270 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728567AbhAGODR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 Jan 2021 09:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1610028197; x=1641564197;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=mcRMdEN1K8IoLzsHqYPEqDBiMpf//jkQglwwKYdNyCE=;
  b=aVA5y10JERRZ2iJDY60+tqigcFPDK5s0WlAfDG36kdaQ/RQvpGfPu1RV
   qHL3Uz3P7/Oc3elKeLVaZFoP0zjm/4XgVpAI6U/CEFOEEbylnTbMJo1Mz
   8A55qQrz9ZzOhjKuoWkjn1LYJOqVEHG0XkR6WWARbB0slTZ22AHPHaFn8
   XvpVzjX873fpf5WceyUoxj5iaq7fCkJ8Xl0dpN4BIldpxsfn5aDrq3uJ0
   cgKWlpzNZe+k/vz/dutQM4kw2h55qWu5sjZBg6D6m4AdzdNM7TBdjXgHM
   Gc7R16LGjm8ziiAjFN2lk1mz6D0hZHQUxfOrT4rNSeUBEUht/h4517X//
   g==;
IronPort-SDR: SbVy0+20I7CmmDQRGpzefrnDe36TK8h+u7wnLqqfyi3k32SBCrt5pO3y79EGNq39jIR7p7j0o9
 E67tayNnI/ctlZqZMKlZC90EuD8suyTc1kIa+vbtU7kPA4xXRg0eM+ysrDXSBXh+t70Vwhm2Ci
 ifcQ28LoOCk4oDksR9VA1aoqg5UuIshs5HEYuadbdpfYY/tS0LN51dUT1X0QRxLtJIsZgEUCHH
 VEM1GxDXgYfVtzR2MGfvjkiTGsxRPbP0GOHhTWsZNLifu7sixPiN/waN9ifNqtnxAT6iJkyKGq
 ss4=
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="102090366"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jan 2021 07:02:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 7 Jan 2021 07:02:01 -0700
Received: from [10.205.29.52] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 7 Jan 2021 07:01:57 -0700
Subject: Re: [PATCH] dt-bindings: rtc: at91rm9200: add sama7g5 compatible
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <ludovic.desroches@microchip.com>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <1610016372-31784-1-git-send-email-claudiu.beznea@microchip.com>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <9ed4f784-8b7a-ec7e-fba6-63329631f703@microchip.com>
Date:   Thu, 7 Jan 2021 15:01:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1610016372-31784-1-git-send-email-claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 07/01/2021 at 11:46, Claudiu Beznea wrote:
> Add compatible for SAMA7G5 RTC. At the moment the driver is falling
> back on SAM9X60's compatible but SAMA7G5 doesn't have the tamper mode
> register and tamper debounce period register thus the need for a new
> compatible to differentiate b/w these two in case tamper feature will
> be implemented in future.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> index 02bbfe726c62..994de43d17fa 100644
> --- a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> @@ -20,6 +20,7 @@ properties:
>         - atmel,sama5d4-rtc
>         - atmel,sama5d2-rtc
>         - microchip,sam9x60-rtc
> +      - microchip,sama7g5-rtc
>   
>     reg:
>       maxItems: 1
> 


-- 
Nicolas Ferre
