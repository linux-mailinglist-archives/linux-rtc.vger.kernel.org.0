Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2FD050CCC9
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Apr 2022 19:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236142AbiDWSB5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 Apr 2022 14:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiDWSBz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 Apr 2022 14:01:55 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3D31DA42B
        for <linux-rtc@vger.kernel.org>; Sat, 23 Apr 2022 10:58:57 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id t6so11842087wra.4
        for <linux-rtc@vger.kernel.org>; Sat, 23 Apr 2022 10:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8Kp5Q1vS0qC7/glbftIgd1JyC43ZLOUVon+K5fIPn5o=;
        b=kdFHFAQI714HGQRNu3HLEzwruvNHj2VG2kP5gN91fvdPuj5IQKcwIQ2h9B6TZe9++t
         LRqVj6ve0sVqn92288cEAFhgJZ+5OEBGqs7KSN6IHMmpA4yOS8ByPlLU71u8VssdxID5
         L1Ab5WnwFlgN3YJfk6UT7bXMX/d9APnKhinl0YiP0TGliMEvtrEVsDn7696t54iIo5Hk
         dJXNS1B8jOE4XUs3e2686L7vXwB8zwVUYFWd/NbTl6bAlGuy7RwONIS2OCfJkp/k/Vbr
         QzoZ1IUAufWjVmT4dp9rNQjWYP/XNO2Gz9ubSQo1xH80juy9eJfNFs3hdc2y0TarnAPe
         pvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8Kp5Q1vS0qC7/glbftIgd1JyC43ZLOUVon+K5fIPn5o=;
        b=miCrQJUT0du6zVFHJafb5YYI1kSnKwQhxkxART5NkuYYfdk41Kxa+UOW9rnUCUFK7B
         1b2Ytg6vIIfL5pFK35N4+KmC6JrYaMG92tNIxUTh3tOBX/Ov3FW6GNLt7fB89glGZA5t
         fT44fvFN0OTYgvIhNMe3tk9otwelwhCG8vVVjiqSUgPsakicNS+3iwQpX2EhaD5ro+cB
         n76Fr8KQ5a8rcQoFNP3Tfn9kru9NuLbtXM6lY5BOV3VcAMECTgFWV1HkkeXSql9CVcyd
         ZOHFp0lEQrD9O5+C8f9RAmmCtm4nMQuJxPFvyG0IQ442KSKzY3ES+kokAX6CfDAhKoGH
         Cqcg==
X-Gm-Message-State: AOAM53210zWNQacn4dFzGZ2CduFTaybYhX8wQrfhXpM9CJQD0znCbptG
        XPY31zNpr4PwuHBwq4wjet56kA==
X-Google-Smtp-Source: ABdhPJy4qom34eZ6mVdIY8SbAZlO8Hyobh8HVWgZA+5RgKrP5ipkq5Vn3x0OnSwah/JrOmbFwKj6pQ==
X-Received: by 2002:a05:6000:1864:b0:20a:9ac6:b166 with SMTP id d4-20020a056000186400b0020a9ac6b166mr8334383wri.354.1650736736178;
        Sat, 23 Apr 2022 10:58:56 -0700 (PDT)
Received: from [192.168.2.116] ([109.76.213.55])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b00392951086efsm7744297wmq.34.2022.04.23.10.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 10:58:55 -0700 (PDT)
Message-ID: <207bacb2-40a3-49e9-e766-433d152149c4@conchuod.ie>
Date:   Sat, 23 Apr 2022 18:58:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/9] clk: microchip: mpfs: fix parents for FIC clocks
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        aou@eecs.berkeley.edu, krzk+dt@kernel.org, mturquette@baylibre.com,
        palmer@rivosinc.com, paul.walmsley@sifive.com, robh+dt@kernel.org
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
 <20220413075835.3354193-2-conor.dooley@microchip.com>
 <20220423014103.8574CC385A0@smtp.kernel.org>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220423014103.8574CC385A0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/04/2022 02:41, Stephen Boyd wrote:
> Quoting Conor Dooley (2022-04-13 00:58:28)
>> The fabric interconnects are on the AXI bus not AHB.
>> Update their parent clocks to fix this.
>>
>> Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
>> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
> 
> Applied to clk-fixes

Thanks!
