Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939A544AE36
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Nov 2021 13:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233548AbhKIM7m (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 Nov 2021 07:59:42 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:54044
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233826AbhKIM7l (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 Nov 2021 07:59:41 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 482003F1E6
        for <linux-rtc@vger.kernel.org>; Tue,  9 Nov 2021 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636462615;
        bh=yZUG7Tb7m1UqX5nCLe8b1PQIfsTUxqRuBTIMx3/ftko=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=D898EUzhhoElf0sywtzsUznZ36Op/5YBxwsBhHFD0m8DnlugqjDtj1RS3Q/C5RFaX
         8tYrYzaiKczM1SCuQ8LOY6BR0qDsikWiAH/drxnwjz5qS7y6WF1eL8auLVe409GofX
         lu7PZPI1JeAAqh+9GhaKMuOtogVNDGUDU3Q0+KQpiD/lUAizNihpSUNXLxcDtrns/r
         6Rk9xs4VZbXFGahmQZjLIUX2e7yYA6FNhKO5qDCB2ZMlh23mL7eSC3iiVaS83CmJt8
         tP0AGxhJC8gG4rfMITA3WggNea7flHGNg+zx2OUnI84Ts8yTjQHYer2Qn8EFPwuMv9
         2POczwnP8MT2g==
Received: by mail-lj1-f197.google.com with SMTP id bn14-20020a05651c178e00b002164a557684so6178881ljb.6
        for <linux-rtc@vger.kernel.org>; Tue, 09 Nov 2021 04:56:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yZUG7Tb7m1UqX5nCLe8b1PQIfsTUxqRuBTIMx3/ftko=;
        b=u8TTIFWryu6OMBgSpoeiCzPuFhIOo/cSG2UTpTfLIIbBhVunBnqPdryGwPgE0vtwLG
         bCcsDLJGGNvIoPp5VT+zDNksLXTyHZqEABVw2B2NwF60H5aVNNcaTA2b6DCSjfrgH8Pi
         jao8JT0+CdTWd6MO2QYhL9E7JBCRVWvP/9qdrTNIBgXCtuZl3dLM3RQtZHCPf5lAfPgF
         wIefvJ1vOa9HnxTn9KAFjdPx4X557sPj8FxzEWnLEyjT1Ymy+t3zpj+0xPIaywMo06Yn
         iOIljEl7/0CQgJcvRZJbNTmKLXpLNx0IcQGZNRrXs/J9SB/OP1cb/WHf/kGqzzU/gmsB
         EF9g==
X-Gm-Message-State: AOAM533xjNukuKE+JzxSGg63Hlu/R+9NSZmpNnxJNZL1zISes6u1w+gO
        qLNnk1rNFEtRw2Fuu3ku0Jp4wu9jVTXZJzJ8NR/+ZpVEZwabjyE/rDax5OAIYODO6IJ/Qe2jkeq
        qXdUH7JjSpOq4k9vjAb2k3RLi/UPiKl5kss2hZA==
X-Received: by 2002:a05:6512:1045:: with SMTP id c5mr6954942lfb.115.1636462614638;
        Tue, 09 Nov 2021 04:56:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwITYDenNraLQf7L9QCEZpNJX/wzJp+LTTIyOssbyLIHoaCcJ+w/+l+RGCCEXGOEyjZkvgRIA==
X-Received: by 2002:a05:6512:1045:: with SMTP id c5mr6954909lfb.115.1636462614426;
        Tue, 09 Nov 2021 04:56:54 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id n7sm2131681lft.309.2021.11.09.04.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 04:56:53 -0800 (PST)
Message-ID: <ca17d6ac-ef8e-b01c-3278-7cbb0d5745e3@canonical.com>
Date:   Tue, 9 Nov 2021 13:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs
 rng
Content-Language: en-US
To:     Conor.Dooley@microchip.com
Cc:     broonie@kernel.org, aou@eecs.berkeley.edu, robh+dt@kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        palmer@dabbelt.com, paul.walmsley@sifive.com,
        jassisinghbrar@gmail.com, atish.patra@wdc.com,
        Daire.McNamara@microchip.com, Lewis.Hanly@microchip.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        geert@linux-m68k.org, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-usb@vger.kernel.org, bin.meng@windriver.com,
        linux-i2c@vger.kernel.org, alexandre.belloni@bootlin.com,
        Ivan.Griffin@microchip.com, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, a.zummo@towertech.it,
        gregkh@linuxfoundation.org
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-7-conor.dooley@microchip.com>
 <f60cf7e0-4f67-f4b3-2596-01114cff6623@canonical.com>
 <71c6917e-1463-c708-550a-726e5fe1566d@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <71c6917e-1463-c708-550a-726e5fe1566d@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/11/2021 13:54, Conor.Dooley@microchip.com wrote:
> On 08/11/2021 21:16, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Add device tree bindings for the hardware rng device accessed via
>>> the system services on the Microchip PolarFire SoC.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>   .../bindings/rng/microchip,mpfs-rng.yaml      | 31 +++++++++++++++++++
>>>   1 file changed, 31 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>> new file mode 100644
>>> index 000000000000..e8ecb3538a86
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>> @@ -0,0 +1,31 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>> +
>>> +title: Microchip MPFS random number generator
>>> +
>>> +maintainers:
>>> +  - Conor Dooley <conor.dooley@microchip.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: microchip,polarfire-soc-rng
>>> +
>>> +  syscontroller:
>>> +    maxItems: 1
>>> +    description: name of the system controller device node
>>
>> There are several issues with this:
>> 1. You need to describe the type.
>> 2. Description is not helpful (just copying the name of property) and
>> actually misleading because you do not put there the name of device node.
>> 3. What is it? Looks like syscon (or sometimes called sysreg). If yes,
>> please use existing syscon bindings.
> 1 & 2 - Correct, it is bad & I'll write a better description for it.
> 3 - Its a system controller implemented as a mailbox. The syscontroller 
> is the mailbox client, which the rng and generic drivers both use.

I understood that pointed device node is a mailbox, not this node. But
here, what is it here? How do you use it here?

Best regards,
Krzysztof
