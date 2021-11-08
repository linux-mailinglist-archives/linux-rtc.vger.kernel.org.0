Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11817449DA6
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Nov 2021 22:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239603AbhKHVMW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Nov 2021 16:12:22 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56518
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231996AbhKHVMW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Nov 2021 16:12:22 -0500
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DCBC33F1E8
        for <linux-rtc@vger.kernel.org>; Mon,  8 Nov 2021 21:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636405776;
        bh=Va/pwg0yU2yK/e7gM+AfCFIYpglqXBbYNHqGSFsajyo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=HZDJP/yYi98geBvIIrvnLp9WoDlQUDG9JO+K5yA0L80aRXjL0ndW/M7u2G+etbG7a
         9sHmagzQWJmV8j2UBbR6DUBf9pweLSb3tL58Ljvjs0fGqxOnkbcUqV99LLPjyizGJp
         VzALPf6OFhJgEhU7b3kUElePaEXLYqQFmHxPiozKzIUYs+e2J0uQ86heKgSPEVDX1f
         e7W/1/EhVSKnboiLKlTf9ID8TWYyFfvoI8xQToSu09/+X+rzKOqTj05+oft9oCe5aR
         rBaaqjctGaYVLWMa+i9wB+8XbS24jTBdUGA90eGhgBFxunb371ES28Sfbb5XuULt54
         zhrYpkLzZZwfw==
Received: by mail-wr1-f70.google.com with SMTP id d7-20020a5d6447000000b00186a113463dso4403230wrw.10
        for <linux-rtc@vger.kernel.org>; Mon, 08 Nov 2021 13:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Va/pwg0yU2yK/e7gM+AfCFIYpglqXBbYNHqGSFsajyo=;
        b=ZMq/cgijAQqKSCJw9j5xLyaEl/hmG9GElimE60/KNAUsupZ+KBugaobpUVpi1O43oo
         VaHjV3wFBlN/hil1mPQNcgcc/6OeuMXVDn4Ae0i+QiztoOVKocjxQPj07EFNeVPaQqA8
         UWT6hXIxG8FY0WtIavmxqVXjubg30jJfI6jh6TAbt0VXXI+F3kDT0IjN2qoyqINOM9zF
         EZXbPNo/2pqNHNWeIZjWq12iZfonE8bMM5RlvW8+YjHFbmBe7upMrJUp/wE7VECKdd3s
         4wmKSwojFkWfziEunTYOOEqXtScSvyntIogm3aZ7ueuyFxw7qT0biUMCiL3dBeq+SZok
         AXbQ==
X-Gm-Message-State: AOAM531GHEJznNW30jqT92Iy3eYuXCZigIK24XV7lJMDy7+4RpbS8cMS
        3H2+knAw0hHXdmVhnsHZ1xisB/ktGF8UzcFHeyaazk/sBDl8XDUM6zfLgsJytpUBwRv6Xk6DinX
        6gnn0Sud318tYiPzOkeE7Us62pA70zBuw2ZYOEw==
X-Received: by 2002:a05:651c:11cf:: with SMTP id z15mr2048856ljo.30.1636405766133;
        Mon, 08 Nov 2021 13:09:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5zuS8P1mHA/OLv+7/rIK0KelVh9uEKzH2K354xcsLSXE2l72piSekseZIEjgtyZT8qG201w==
X-Received: by 2002:a05:651c:11cf:: with SMTP id z15mr2048814ljo.30.1636405765859;
        Mon, 08 Nov 2021 13:09:25 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id p21sm1933204lfg.18.2021.11.08.13.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:09:25 -0800 (PST)
Message-ID: <8a316610-c0f6-dadd-4745-bd3aff76372c@canonical.com>
Date:   Mon, 8 Nov 2021 22:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 03/13] dt-bindings: soc/microchip: update sys ctrlr compat
 string
Content-Language: en-US
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, atish.patra@wdc.com,
        ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-4-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-4-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Update 'compatible' strings for system controller drivers to the
> approved Microchip name.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/mailbox/microchip,polarfire-soc-mailbox.yaml     | 4 +++-
>  .../soc/microchip/microchip,polarfire-soc-sys-controller.yaml | 4 +++-
>  drivers/mailbox/mailbox-mpfs.c                                | 1 +
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> index bbb173ea483c..b08c8a158eea 100644
> --- a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: microchip,polarfire-soc-mailbox
> +    enum:
> +      - microchip,polarfire-soc-mailbox
> +      - microchip,mpfs-mailbox
>  
>    reg:
>      items:
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> index 2cd3bc6bd8d6..d6c953cd154b 100644
> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> @@ -19,7 +19,9 @@ properties:
>      maxItems: 1
>  
>    compatible:
> -    const: microchip,polarfire-soc-sys-controller
> +    enum:
> +      - microchip,polarfire-soc-sys-controller
> +      - microchip,mpfs-sys-controller
>  
>  required:
>    - compatible
> diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
> index 0d6e2231a2c7..9d5e558a6ee6 100644
> --- a/drivers/mailbox/mailbox-mpfs.c
> +++ b/drivers/mailbox/mailbox-mpfs.c
> @@ -233,6 +233,7 @@ static int mpfs_mbox_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id mpfs_mbox_of_match[] = {
>  	{.compatible = "microchip,polarfire-soc-mailbox", },
> +	{.compatible = "microchip,mpfs-mailbox", },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mpfs_mbox_of_match);

Please split the bindings from the code.


Best regards,
Krzysztof
