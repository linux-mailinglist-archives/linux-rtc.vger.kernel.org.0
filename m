Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB9B41C635
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Sep 2021 16:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244987AbhI2OC3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 29 Sep 2021 10:02:29 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51342
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244886AbhI2OC3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 29 Sep 2021 10:02:29 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9500A4019B
        for <linux-rtc@vger.kernel.org>; Wed, 29 Sep 2021 14:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632924047;
        bh=mf2QkVX2ZzY2roVO0lt54DiqIHZ/KT4mIU4bIZQY7eA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=VM6ehVu/rPc0zGAlc1wjgAWgHIamgnXi5ZPzXzDaTvyPW/WxwKO4EK71NHEEaPynJ
         n/RBrObaFQQAzqd9zQM8cLw4wS9feeKezzky6/4JElEzqMPmsmirVofqTZXknnB8Lz
         9b3WpgryyoiWIeAvtvu73XNt3GPLogacbGX1VP6AYinKXBHKdIV1OiV0ex9sp/D9Dx
         vAcMdN3QZkSV++bFrP0pWIpXArYT5GPVHmujut68g1G6RdoDcM8FK8fYf6pM8zqiHQ
         RR08e29FNlyqCfqjJ7tiSiZfJhQHbMcbidWPn6goWgGMUwF8L/4qeTQmvgDFT+q03a
         V2VpghW1M9tbg==
Received: by mail-ed1-f72.google.com with SMTP id s18-20020a508d12000000b003da7a7161d5so2521550eds.8
        for <linux-rtc@vger.kernel.org>; Wed, 29 Sep 2021 07:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mf2QkVX2ZzY2roVO0lt54DiqIHZ/KT4mIU4bIZQY7eA=;
        b=6iLgBBvpm8mkeFlePobpnfwAW0ZBgvXiuSClo2bjc+DlzqA2ejrpoCmPAmHdav/Vwz
         4+OHIa//vkC+S8N/TRGJc7CmlP5BOJfTeMT0rif2qZYCSL1xQRO2NFC0l0jrc8QNlZ4D
         jtMbz+ab6fArgFLkyAkbTbBXt9ju5Vz0clCz/uCJaJXTNjg3ny2mGPS+R2UFQ/M2yVoq
         c/dt/GRM9arfGNMPJ1xONvLoIu2jhZsaUlV8ufgYDBAHFChv/gAn3mJ8pXoetnyb3azn
         dwPRBdSvpBB+4D8QRpBBWmCLdW+DZdpO3ickvDAlfX5yW+ppV5lvLXsobGoNmLv83/U0
         l+gA==
X-Gm-Message-State: AOAM533sbbZIspzpf+iBwmiA54K/ZrWBCGTtr7Llpc4EtYok0JjcdVNM
        33Wgm+5VCG5aXvm1UXAhVtNpsFrOtjy8jqMq7C8tg7CnTM4LRYh8untCWS1261+pNzil0bf5k2T
        JCetrl+7tJ7aC79vWh4m6+xyqZN1xxGSfzRfygQ==
X-Received: by 2002:a2e:a238:: with SMTP id i24mr61874ljm.474.1632924036544;
        Wed, 29 Sep 2021 07:00:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKt5l2t81qxHBKi3o/CZN3L1oKUtNTtom/CYUokyE0JkQifqqKnv7EtIY4e4dm53UQ6EHscA==
X-Received: by 2002:a2e:a238:: with SMTP id i24mr61835ljm.474.1632924036320;
        Wed, 29 Sep 2021 07:00:36 -0700 (PDT)
Received: from localhost.localdomain ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id t135sm252900lff.203.2021.09.29.07.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 07:00:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Will Deacon <will@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will McVicker <willmcvicker@google.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        kernel-team@android.com, linux-samsung-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Saravana Kannan <saravanak@google.com>,
        Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 01/12] arm64: don't have ARCH_EXYNOS select EXYNOS_CHIPID
Date:   Wed, 29 Sep 2021 15:58:49 +0200
Message-Id: <163292392314.29281.7860159491587813094.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928235635.1348330-2-willmcvicker@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com> <20210928235635.1348330-2-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 28 Sep 2021 23:56:18 +0000, Will McVicker wrote:
> Now that EXYNOS_CHIPID can be a module and is enabled by default via
> ARCH_EXYNOS, we don't need to have ARCH_EXYNOS directly select it. So
> remove that.
> 
> 

Applied, thanks!

[01/12] arm64: don't have ARCH_EXYNOS select EXYNOS_CHIPID
        commit: 6ad4185220e6e3b7ebac7c7a5f55197aedd000da

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
