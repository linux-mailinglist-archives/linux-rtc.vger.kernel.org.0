Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F8445CE8
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 14:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbfFNMfS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Jun 2019 08:35:18 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35745 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727544AbfFNMfS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Jun 2019 08:35:18 -0400
Received: by mail-lj1-f196.google.com with SMTP id x25so2259007ljh.2;
        Fri, 14 Jun 2019 05:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1kNA1FB4w/lkcMPFwJQ6UiFI1ZjIBIZGglQjoe4iAUs=;
        b=ocmOFEN8JsrpnDaEcsGswFmg310y4igtpJoHbSyYKbYtP6eA3pxzE6/IguqrLmKbtd
         enkJhHXrJmfUV01ZITcnbS+84TpSh1Kx5x9ITe2nuQzhfrzzdZZFT7ErtcnFxtNIfGEx
         FCzgRkGkr1fHeJUJqe1Tp90kFSalyxEdofvBYrwwBIYe7BVdEx7Yk6nj2k4i20B6DyQ+
         iNfKcNwL2n16CaQN7Siy+oAAxlh4d/SuV0EF9gV/fNaN2Etf3OQOFczonG8jyUIRgjXg
         70ByDAETbX1TbRfg+V+EKC8nkWWdRHM1+aP188aA2C7ZwVkXiEoKb+j3k9i9TH8ANPd9
         uXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1kNA1FB4w/lkcMPFwJQ6UiFI1ZjIBIZGglQjoe4iAUs=;
        b=E37fyv//A8uW5W4M9gFVWN7PMTMB6UnUmGHwskIt2Vfsufc8lONa5rIG3td5JJ52aD
         nStPqcZ3OpX60LycXGEd2iHGpM8Lkr1bQC5lfynj3I45v4kmyMbFMhQY2oDRbYNOM0AC
         Ox4druzBOZTTbT0JKSe5bG7dV0qYYZztWT6W+HmzbtzN3XtZWicxEtCQgsAnLQ+sLbwF
         LUWHjSGwHjtKCSxQAkWtbZeLml2Q4RqTY75C3lAkjXiotWcKPGLIBcHjxZrZRUAFh7SJ
         wN3rm5MIeykihbCuyrv7lDhImPOpSaOtp/4U+wSShkk6EFIguXuwCNkrH+Z4t6TmuU7I
         +E1w==
X-Gm-Message-State: APjAAAUzG2861rSjRsnBYKxUWjC8LgUTVjr6iA0hW5s1saipdWq+wlJo
        MXfzBEiFqafDcW1GNlmYtDk4STKa
X-Google-Smtp-Source: APXvYqwh4OFKtZvWP7uzgjbU+/ho8VXj0IhWKKKDVkMhRs9y/U3uxnjJ0rLmPYrR+aBTHXTly4uUAQ==
X-Received: by 2002:a2e:9b10:: with SMTP id u16mr4040443lji.231.1560515715977;
        Fri, 14 Jun 2019 05:35:15 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id q2sm462739lfj.25.2019.06.14.05.35.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 05:35:15 -0700 (PDT)
Subject: Re: [PATCH 2/2] rtc: tegra: Implement suspend clock source
To:     Thierry Reding <thierry.reding@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <20190614104747.19712-2-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d3de8c42-3718-d87d-3c38-af18c671036c@gmail.com>
Date:   Fri, 14 Jun 2019 15:35:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614104747.19712-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

14.06.2019 13:47, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The suspend clock source for Tegra210 and earlier is currently
> implemented in the Tegra timer driver. However, the suspend clock source
> code accesses registers that are part of the RTC hardware block, so both
> can step on each others' toes. In practice this isn't an issue, but
> there is no reason why the RTC driver can't implement the clock source,
> so move the code over to the tegra-rtc driver.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---


[snip]

> +static struct tegra_rtc_info *to_tegra_rtc(struct clocksource *clksrc)
> +{
> +	return container_of(clksrc, struct tegra_rtc_info, clksrc);
> +}

Shouldn't hurt to inline this function explicitly because I assume that it won't get
inlined with a certain kernel configurations, like with enabled ftracing for example.
