Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68EC341C53C
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Sep 2021 15:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344072AbhI2NLQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 29 Sep 2021 09:11:16 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53690
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344071AbhI2NLP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 29 Sep 2021 09:11:15 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 139A83F325
        for <linux-rtc@vger.kernel.org>; Wed, 29 Sep 2021 13:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632920974;
        bh=KsbVur2/qli+4fCqIZBdqDED21IaMcFYxs808+TH5nI=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=dbpIqXuU194VobmbdRZEzR/bb05zQZVwoy8Up5zLWbWO6jgeaYRlO8NKrX+NE8H+V
         DljIJpmqJhiY0DERIRwtuQ8i3NdjBllaHgkN4xWbaYe4Ekdb5dJtLjCsqMhgo7p3K+
         F5qeANrZKjZ1SQv3IieMrEbuRERYSg+Qr/XyVI1AKe+mRBQ2oRghiDOBYqX2Kgm7RU
         nAW2CVrpHwS5z0jsr+A78nviAF0xLTPiPagCk1I9dXHP5YooWC05SOASvCt42GhOLa
         TZ3nEyAdWAY2zLMrLz9+mt3iiUhYFKZJ1NJziDc8UkyMWMRqwagnul1tk9+kQcWKAu
         l70kDh3Q7Dbhw==
Received: by mail-lf1-f71.google.com with SMTP id c24-20020ac25318000000b003f257832dfdso2292722lfh.20
        for <linux-rtc@vger.kernel.org>; Wed, 29 Sep 2021 06:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KsbVur2/qli+4fCqIZBdqDED21IaMcFYxs808+TH5nI=;
        b=IjyS5wZdurgi5lSlLccFkylKFBXABYG2eHXlFnr65hQjFR3gWOlIWbKX4EgVZUKh6H
         ttiITdmeAh26D1gwwN96CdNJcKnlyUaO/Kbjvz/oFnjY81nyGljkVHnT56f+1rrCpyJZ
         wGBb/0LWAnsS9cwzWz1oVsRGQ6/rTTECEDkmbD8p49Bw198h/8E9EuBUHJuLJu6d96Wr
         8k3QewXjkVQ0Nb7xqa4dZ5C9+9i7ZDS6x7flP/iQhAzsYNs5sr3JxxWLZcpP9sFmkRHK
         /4F5x8P2W4Le59to8cibhAqjMGc3V8mAr7Id5DiBH0pGElydDPWKh3dzZHo2o2BwiCVI
         tLpw==
X-Gm-Message-State: AOAM530yfFvsfEk4Mr8CzZe5q1hFOH5A4AyqwLwI6Ml75xm6+TYtpv5/
        Gg9l1TWVec8s+fJDQIZ0Y/Vuvup0Q6Xw2SnuX/VSzFAK/XJSYn7gne5ExlyswSq7t/YRAAeAoPn
        fwYFx1p4EHOjM56mNQ2uMXD/mZzCR9yHuQPIPZQ==
X-Received: by 2002:ac2:59c7:: with SMTP id x7mr11996699lfn.662.1632920962465;
        Wed, 29 Sep 2021 06:09:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKrXQMmrpXBJdFGfniYnh95CJW4r5XX/GOWAswOXl0aBJ33mQHCMYimiRr8Trj3H0MHLM7Ow==
X-Received: by 2002:ac2:59c7:: with SMTP id x7mr11996657lfn.662.1632920962259;
        Wed, 29 Sep 2021 06:09:22 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id b22sm241800lfs.27.2021.09.29.06.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 06:09:21 -0700 (PDT)
Subject: Re: [PATCH v2 07/12] clk: samsung: set exynos arm64 clk driver as
 tristate
To:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <20210928235635.1348330-8-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ac328b6a-a8e2-873d-4015-814cb4f5588e@canonical.com>
Date:   Wed, 29 Sep 2021 15:09:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928235635.1348330-8-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 29/09/2021 01:56, Will McVicker wrote:
> This sets the COMMON_CLK_SAMSUNG and EXYNOS_ARM64_COMMON_CLK drivers as
> tristate so that we can compile them as modules.

This is not the only thing you are doing. You are removing the enforced
built-in and this must be here explained and tested. The policy so far
was that all S3C, S5P and Exynos supported platforms select (enforce)
necessary drivers. Please explain in commit msg reasoning why this is
being changed and what's the impact (whether it actually works).

What is more, it seems you entirely ignored Geert's comments. I pointed
attention to it last time and you just said you will send v2 instead of
joining discussion.

It's a NAK for this reason - ignoring what Geert brought: you just broke
distro configs for Exynos.

Best regards,
Krzysztof
