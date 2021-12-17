Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91807478F15
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Dec 2021 16:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237920AbhLQPIP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Dec 2021 10:08:15 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:57470
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237927AbhLQPIM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Dec 2021 10:08:12 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0465E3FFD4
        for <linux-rtc@vger.kernel.org>; Fri, 17 Dec 2021 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639753691;
        bh=EscRM3zeuMe4QRAvQ51JRRs9n/Wn3urOySWDrMNRXHw=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
         In-Reply-To:Content-Type;
        b=RsVVcqqQRpmymRHJ46vzObXzzLAlv2DGx4UNMeCnhpX9HXnlTb4Hy0gnR/MhuxAqf
         fa85k4M8OnZ8WiFk5RwRXxBoNN4uldrDfJsSeDLgZKvK+z1stPl/qq5jGIiVwH+32F
         S0IoU+n8x0nuORyXy85+tcE/rbB1sjjcExXjdWBPsttfk6Nvu2quIETFO9pdpp5BKE
         Rwoq/WUdA3vhs38/crb2UQwFhgHIX1D9AFiwzp0y/Azxgtya6Ff/y1Xd8Tx6PKGp5p
         j4ybav8qJ0FuXed807QrqoJ9xSrTEZneJWhzHrVfXjvKXNpKtUeFDTZ2j1oILaEjZu
         AZjXl63ZtPL1w==
Received: by mail-ed1-f69.google.com with SMTP id b16-20020a056402351000b003f81e62ab2aso1110086edd.8
        for <linux-rtc@vger.kernel.org>; Fri, 17 Dec 2021 07:08:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=EscRM3zeuMe4QRAvQ51JRRs9n/Wn3urOySWDrMNRXHw=;
        b=TEK2aWhL2o8oC9DsxU4krnAJndwX5JFvzsz9XLTALxo2ilMsDanzUJWrN3e215JD3e
         JchQB5FL0ILnjhecKOjDziZ2e6pKebIOnq5Rn5Q9xEUxZ/6ASVxDVdpc1NFblY6Ak8m8
         Ei2rF7SP+lEWNpIDwpZ7WSdBS39r1phzVFFvdXhTpNTqFcUgoXNIFj092z8n/DPUGWA/
         Wzjd8KEwrBGYztdp3I9sowqs0j3hZruIaA0vZNqL1wBQ/aUC3J4I+CaZT1a6MI5aR/YZ
         l8gWRHfH/lZSQwfepF40j7CeElaPM/npMdj3CyyLdJFx1EM2komzLxY7xU1UCPFMtsmZ
         HxGA==
X-Gm-Message-State: AOAM530QeHhs9HbzbqRjwEHwREpbtiDZzNvpUZd3mwZOmP7//FlEXmOZ
        HkKXHtQMCs/ASR8obyBj43ssqviIHov0Uw8q7fAzGTMk0DculP308q+I8/AqAaTNdoiszmaKdDA
        M9U0pnzOgXS+OxIESUG/OjRihA8xNQjKolUetAw==
X-Received: by 2002:a05:6512:368a:: with SMTP id d10mr3057499lfs.476.1639753678783;
        Fri, 17 Dec 2021 07:07:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjit/KxYQojMyrYyqg3tppu8lupjtyMuTl3o4zZeCjXmcoayEWshoXqKAPpfREvzZOsoCa7Q==
X-Received: by 2002:a05:6512:368a:: with SMTP id d10mr3057453lfs.476.1639753678217;
        Fri, 17 Dec 2021 07:07:58 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id 18sm1764464ljr.17.2021.12.17.07.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 07:07:57 -0800 (PST)
Message-ID: <19cbe2ba-7df5-7c7c-289f-6dc419d9f477@canonical.com>
Date:   Fri, 17 Dec 2021 16:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 06/17] dt-bindings: rng: add bindings for microchip
 mpfs rng
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com, heiko@sntech.de,
        lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
        ivan.griffin@microchip.com, atish.patra@wdc.com
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-7-conor.dooley@microchip.com>
 <e59a60d5-4397-1f7f-66ab-3dd522e166a0@canonical.com>
In-Reply-To: <e59a60d5-4397-1f7f-66ab-3dd522e166a0@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 17/12/2021 15:53, Krzysztof Kozlowski wrote:
> On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Add device tree bindings for the hardware rng device accessed via
>> the system services on the Microchip PolarFire SoC.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../bindings/rng/microchip,mpfs-rng.yaml      | 29 +++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>> new file mode 100644
>> index 000000000000..32cbc37c9292
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>> @@ -0,0 +1,29 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Microchip MPFS random number generator
>> +
>> +maintainers:
>> +  - Conor Dooley <conor.dooley@microchip.com>
>> +
>> +description: |
>> +  The hardware random number generator on the Polarfire SoC is
>> +  accessed via the mailbox interface provided by the system controller
>> +
>> +properties:
>> +  compatible:
>> +    const: microchip,mpfs-rng
>> +
>> +required:
>> +  - compatible
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    hwrandom: hwrandom {
> 
> Three topics:
> 1. Node name (as most of others are using): rng
> 2. skip the label, not helping in example.
> 3. This looks very simple, so I wonder if the bindings are complete. No
> IO space/address... How is it going to be instantiated?
> 

OK, now I saw the usage in DTS. I have doubts this makes sense as
separate bindings. It looks like integrated part of syscontroller, so
maybe make it part of that binding? Or at least add ref to syscontroller
bindings that such child is expected.


Best regards,
Krzysztof
