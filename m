Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FCF6AB882
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Mar 2023 09:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjCFIjh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 6 Mar 2023 03:39:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjCFIjh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 6 Mar 2023 03:39:37 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5611E9FF
        for <linux-rtc@vger.kernel.org>; Mon,  6 Mar 2023 00:39:35 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so7577724wmb.5
        for <linux-rtc@vger.kernel.org>; Mon, 06 Mar 2023 00:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678091974;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdXHSSzFb0wf4Z5ebFpbSvGWzd8D68jDgoc9WISe18M=;
        b=YDzgs6ohOBXeckWB2RLnBSj0GvWH9mWSPqHl7QN2VIHs2zzVMceOCigWeXjTmItup+
         ylJ/DahLMUL15wDbIQfjxSRUT00BYTlrmBEvu6yHalSxCyWZW7/deyfhlV5PXgfban4O
         sU/hynle9mnPZdsSXvAwD4kkqRcw3202+XtP12PUFbpXN3DPfJnWpwx99l67bUA1NUX4
         gogwcJU6OO5Dk68JqmiBKbYVFvPEbyo3bwSgF/7ZGzVgQluCeaIWHqi+/CXl1AvHvjW4
         df5uMI0YevCDCL/WUYhn81wzKOaarOuDdwXXrnfUq3a0pVFR7Mj3wilOeozaNjVe4eMP
         3T6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678091974;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdXHSSzFb0wf4Z5ebFpbSvGWzd8D68jDgoc9WISe18M=;
        b=ISz7pfrg7suiBidP+Xe90v60pOfCsL6WvE+ms0NBKodvTtZyD4uP222mQirpogg7Kk
         lo5AXnu7sCgGU0m8QfqiBLrUie48h415qUP8n/IkP7bAxDYVHvlK0q98Ba3LT/CH5yAJ
         hkkUP8PowDaYY6tFydJsE7J1jZZrDYv3d1vYhSW50fBXa7wUVYKJ0zB9EAz6baSRgShR
         1ZGN3FZ/xOO9I3UECKo44uCotg1Q9DhKzWlelWR17j8oM/8/wHa4AfYEaQOGZJugQJXP
         +ErSkO7LQVWgN7b1x1e7j2CtZmq33VLXZoDTvwMziV5m5CG3kqQXzCLRc6+i4ecShA/3
         Di5A==
X-Gm-Message-State: AO0yUKUE6WF9rCC2kmiiZwSNp3wKhzuxjkWvKf4qpBsznINrCXbAg4Vp
        Z0mgp7tCcjQslN+Td2GW4sEWiw==
X-Google-Smtp-Source: AK7set+ZWZw+hQJ/2sk3ResOt44ySPYhF3lJa5MGYX4FLkyMzo9GSQeeqZSK5eB9zmeofrYdEnx6Gw==
X-Received: by 2002:a05:600c:350c:b0:3dc:40a0:3853 with SMTP id h12-20020a05600c350c00b003dc40a03853mr6535425wmq.11.1678091969437;
        Mon, 06 Mar 2023 00:39:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d1-20020a5d4f81000000b002c54e26bca5sm9190736wru.49.2023.03.06.00.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:39:29 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
Subject: Re: (subset) [PATCH 0/6] dt-bindings: second batch of dt-schema
 conversions for Amlogic Meson bindings
Message-Id: <167809196860.10551.9031776722379367022.b4-ty@linaro.org>
Date:   Mon, 06 Mar 2023 09:39:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On Thu, 09 Feb 2023 14:41:36 +0100, Neil Armstrong wrote:
> Batch conversion of the following bindings:
> - rtc-meson-vrtc.txt
> - amlogic,gxbb-clkc.txt
> - amlogic,gxbb-aoclkc.txt
> - clk-measure.txt
> 
> And in addition document the System Control registers top node.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.4/drivers)

[2/6] dt-bindings: soc: amlogic: convert clk-measure.txt to dt-schema
      https://git.kernel.org/amlogic/c/2227e738b30bf20380a48391a73752c52f5f5c6a

These changes has been applied on the intermediate git tree [1].

The v6.4/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

