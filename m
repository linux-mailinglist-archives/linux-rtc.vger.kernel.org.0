Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87C294F98C0
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Apr 2022 16:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237256AbiDHO7e (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 Apr 2022 10:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237262AbiDHO7d (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 8 Apr 2022 10:59:33 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D04911A572
        for <linux-rtc@vger.kernel.org>; Fri,  8 Apr 2022 07:57:28 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id qh7so17788022ejb.11
        for <linux-rtc@vger.kernel.org>; Fri, 08 Apr 2022 07:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bwWAsuVSyIcDlyBKBBDsTR0Suq2qXvRKtK+9kqXxJPg=;
        b=xY1Pzqt04xUTAmgyDqXLrjjJ/AWBFiky28VR5a2eQlfnIg7YMfbLJsKQzaTCjux/nv
         qIGKMKoWMfy6arkHpKNRr8bYhlKTu9SqyHu/BO7BEL6Lhpqj65Sx2j348KZrKbiRuO1U
         V++0f2I8nmZ+NRA80VaMqBRcJhYSux1n3PXfqXGEJLWdN62fMkEH/dxpN1V+pE5dbRem
         Emxv6zOyv+t7hAcONpvF2Dhxmr5jodbyrd4LL4j9Hxm/gC2OglvgTw1EiKr/lN8q7pR4
         ChGDmN4d4ukhI2hMTVvyWy83eEMQGDck00bzTmuFp2nslLx3YTuB8xx36C2sp3vSguoW
         zppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bwWAsuVSyIcDlyBKBBDsTR0Suq2qXvRKtK+9kqXxJPg=;
        b=Tb3MZB0xClmQIv9Iciptd2y72jtwttnlx10GJTnan7vhOK6+MUvG/pFK7nBQLpBZip
         uB62Nbly0jkJSJI3ioCfjMck7kB283luW1CrzYUgWcbCHagqZUmA0ORBExdRORT3qCgU
         r5omtyAF3PPkgeSmFF4PT95wPRDs5sZwRzJ/hu9j74ynsgIlWKRucaHb/cNQ5S8qvnsR
         jiDb1vTCLhoIMIFz6+o2lsjECMc802LTT42BPYT6rcI7eE97JPVE0EpmN/tP1u8faRNm
         tQnzle7f5QQG9a6imrmzH9HLRdxqFCoOmrvBqvmueM5Jsx3+2qx/c43cN8qGaX5f/1Ki
         1nJA==
X-Gm-Message-State: AOAM530Ym7aWUm7Vx67RfRH+vk4JmH+JKgN7Ib3rwKiQVjVTHE3KM/ZJ
        OcQnAoMAG7l9tXd5P5zl08zwhA==
X-Google-Smtp-Source: ABdhPJw+yTl+Mo/vlBuFxJyVx9XZK7ozwB+3E3h2yeMqdeLiLxr/cmMRzc0kZC0MLpwZlFDMI5QLrg==
X-Received: by 2002:a17:907:1c0b:b0:6e7:f58a:9b8e with SMTP id nc11-20020a1709071c0b00b006e7f58a9b8emr19200831ejc.438.1649429847151;
        Fri, 08 Apr 2022 07:57:27 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id w14-20020a170906d20e00b006cee22553f7sm8742891ejz.213.2022.04.08.07.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 07:57:26 -0700 (PDT)
Message-ID: <1fa15b36-7a84-e0ac-2c56-d6a2bec566ff@linaro.org>
Date:   Fri, 8 Apr 2022 16:57:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 0/7] Add rtc refclk support for PolarFire SoC
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com,
        sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        palmer@rivosinc.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408143646.3693104-1-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/04/2022 16:36, Conor Dooley wrote:
> Hey,
> As I mentioned in my fixes for 5.18 [0], found out that the reference
> clock for the rtc is actually missing from the clock driver (and the
> dt binding). 
> 
> Currently the mpfs clock driver uses a reference clock called the
> "msspll", set in the device tree, as the parent for the cpu/axi/ahb
> (config) clocks. The frequency of the msspll is determined by the FPGA
> bitstream & the bootloader configures the clock to match the bitstream.
> The real reference is provided by a 100 or 125 MHz off chip oscillator.
> 
> However, the msspll clock is not actually the parent of all clocks on
> the system - the reference clock for the rtc/mtimer actually has the
> off chip oscillator as its parent.
> 
> This series enables reading the rate of the msspll clock, converts
> the refclock in the device tree to the external reference & adds
> the missing rtc reference clock.
> 
> I assume it is okay not to add fixes tags for the rtc dt binding?
> Since the clock was previously missing, the binding is wrong, but
> idk if that qualifies as a fix?

Usually ABI breakage, even if accepted, should be be tagged as fix
because it is clearly then a break of other peoples' trees...

Best regards,
Krzysztof
