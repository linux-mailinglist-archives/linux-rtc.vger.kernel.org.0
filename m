Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E875850C30D
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Apr 2022 01:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233939AbiDVWoB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Apr 2022 18:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233598AbiDVWnl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Apr 2022 18:43:41 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB37C20F215
        for <linux-rtc@vger.kernel.org>; Fri, 22 Apr 2022 14:40:34 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id k4so2045372plk.7
        for <linux-rtc@vger.kernel.org>; Fri, 22 Apr 2022 14:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=hprmnOUA4/3FlmJh7kQF6XL3/Oe5JP21iOb+ppvENHA=;
        b=VdTgxJp6iaQGYLdO2T00e5mydN8yUlSBKdxKAR02oKgdllMIajdCnVACLvEDHFAm0K
         +FdTgKJYWpIdn0HVA3RD0Ql+Vl0U2Q0CyCxHBWI8W56ilGD7Bdh0PK0Ho6bF49WHDXH6
         WrFIMtgPHK9MqZchFV7tUBu3FHfY/x4rQj7vlxQ6bvaQDGcFvS4155E5zFh5RNxjf/zq
         wnOYaXbdhPyWGL2hUvO9hiETdErtm3tKRfS24aAbvMbl/UQn/Fjo2xF6Ldw9kixJdZ84
         B2zbkO5eAi3VuDIrZhhODYWj7oqQ3yL+07L9w/3Q7N2IQIEv5wS/okO4N3rdG3E5bphy
         0prA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=hprmnOUA4/3FlmJh7kQF6XL3/Oe5JP21iOb+ppvENHA=;
        b=4/3ofp2xBCpuJZhDeFg923ClMBUpTKM77whDmjfCyAEc9TDhXG4TgKP/uGNLfmdAmc
         4dkgIMN1FcNc+O8F8ZlM2tRbCt+aQ6ICYEMFReo5DTw6ZlvCTY72PEEy13M1rR4KsryH
         azoGJKr6n/rlzVQ/+1PgSPJLBMgRpLSqfa5sFOPPFpJuQvt7KLhuG7vPzqnysZry3ok4
         PA+ixGbJ8Y6QfGRHextArLt/K0WVEz75wAz8Umjf3o06lheZWPPh3rInc1iWHNOGC/90
         DwbOIWLkgYfqEklHjTFG3LBObpx55O/jV1S5pUedyZRsM4jPCWdhKKnMxD0by7mLOG4h
         hs4A==
X-Gm-Message-State: AOAM531ROLyAjrUurk4l81wntChW7DDWmSyHcUIHycisD+Yvw0+b5hRb
        bVtq2yNh+Ewlz3pRs6/wJdU3wQ==
X-Google-Smtp-Source: ABdhPJy36dziWxrx9VNGKb+ZJ9QYf23DzNrptVA5BjFCnHIlqW+yS/E17cWlIdJ736Efbyw8yGz3uw==
X-Received: by 2002:a17:90a:8418:b0:1d2:7c69:e3bf with SMTP id j24-20020a17090a841800b001d27c69e3bfmr18408269pjn.44.1650663634143;
        Fri, 22 Apr 2022 14:40:34 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id i6-20020a628706000000b0050adb5a4452sm3540245pfe.101.2022.04.22.14.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 14:40:33 -0700 (PDT)
Date:   Fri, 22 Apr 2022 14:40:33 -0700 (PDT)
X-Google-Original-Date: Fri, 22 Apr 2022 14:40:27 PDT (-0700)
Subject:     Re: [PATCH v3 0/9] More PolarFire SoC Fixes for 5.18
In-Reply-To: <986c73df-9634-d18b-eed3-37584fa2ea89@conchuod.ie>
CC:     sboyd@kernel.org, mturquette@baylibre.com, aou@eecs.berkeley.edu,
        Paul Walmsley <paul.walmsley@sifive.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, daire.mcnamara@microchip.com,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
        conor.dooley@microchip.com, atulkhare@rivosinc.com
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     mail@conchuod.ie
Message-ID: <mhng-08dea5a1-77b8-4b79-93e3-cda9fffdf2ff@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 22 Apr 2022 14:10:55 PDT (-0700), mail@conchuod.ie wrote:
>
>
> On 22/04/2022 22:00, Stephen Boyd wrote:
>> Quoting Conor Dooley (2022-04-22 12:59:09)
>>> On 22/04/2022 20:39, Palmer Dabbelt wrote:
>>>>
>>>> Thanks.  These generally look good to me, but I don't see acks from everyone.  I'm perfectly fine treating these as fixes and taking them through the RISC-V tree, but looks like it's mostly clk stuff so
>>>>
>>>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>>>
>>> Ye, hopefully they go via clk. Stephen replied to v1 or 2 so
>>> I figure they're in his queue :)
>>
>> It helps to be explicit in the cover letter. It's in my queue but I put
>> it on hold because the cover letter didn't clarify what tree it was
>> intended for nor the priority of what is being fixed.
>
> Ah right, my bad. The coordinating things between trees stuff is
> still pretty new to me. If you could take the lot via clk, that'd
> be great?

No problem, the multi-tree stuff is always tricky.  It ended up in my 
queue too, but I fast-forward to the latest version of each set as I 
stumble into earlier ones so I guess I got here quickly.

Having these go through clk is better for me, I'll ignore them.

Thanks!

>> Is boot broken? Do I need to send these up to Linus next week as part of
>> fixes for this merge window?
>
> Boot is not broken, I was hoping this would go into 5.18 to avoid
> having to deal with two different sorts of reference clock DT
> entries - 5.18 where the DT provides the mss pll & 5.18+n where
> the DT provides the input to the mss pll.
>
> So, not next week urgent, but as fixes for this window please.
>
> Thanks,
> Conor.
