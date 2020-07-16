Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB6C221F65
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jul 2020 11:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgGPJHA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Jul 2020 05:07:00 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35620 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgGPJHA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Jul 2020 05:07:00 -0400
Received: by mail-lj1-f193.google.com with SMTP id q4so6341975lji.2;
        Thu, 16 Jul 2020 02:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OBEQGPTChpp2rgfOeM1kSlSWAgJYyyqDBB2eHOFChvg=;
        b=E3WGiQii4LSgSwQD1wK61QMPu1byZy4EaIJ5eFfCeE01Q2L4FTjQmvV7W0f4hrxcSA
         36V2Kh3nnTexA6Km5cqGc7fsFPCStRMb5kyFJ5CXvzksAHZa9QNU7uESMHqXXX5Q2CNe
         L/w2ijxPJSakpFWYWrJosDlboAPRjl4Cf2E5TnbVBqUMF7brV/jYAzwZwb8upw4wNTiO
         KlIltQIontVYk/lRA6Ks3R8IHTEwCMuqbaEcK3ieTQcxiRa7ICicjVmF/pWZFZ3SCVEb
         OsP8MM7hH3R2t5lucWqbHD5DKv+o28mTHvWvdWonK8hVrMC4Q2DXR2u3dqdhf4tqnr2a
         /gsA==
X-Gm-Message-State: AOAM530UIwgvZjaP2H7+4Ts5Q7EbtLs4glcdLbgAUU+mpY+47NuOQO2G
        6a48DhRfXee0rbzYJ5IXbcGjouyr0XHmpnjkqlA=
X-Google-Smtp-Source: ABdhPJzY4AtdWyo0zU9lTfnS590Gsucs///uO2eLVmlTpmxBUsgFn3PU56CccKqZUhFsj1MTJh4QVTSCc2tt6OsY5EQ=
X-Received: by 2002:a05:651c:3c2:: with SMTP id f2mr1584485ljp.37.1594890418508;
 Thu, 16 Jul 2020 02:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200716053452eucas1p24dedd4565b90817c244724b1c52a8329@eucas1p2.samsung.com>
 <20200716053438.3498-1-m.szyprowski@samsung.com>
In-Reply-To: <20200716053438.3498-1-m.szyprowski@samsung.com>
From:   Sudeep Holla <sudeep.holla@arm.com>
Date:   Thu, 16 Jul 2020 10:06:46 +0100
Message-ID: <CAPKp9uYCKBpWazGCV8gw8U0ZBB-X5UkeSw4+_5m6awZ8W=azFA@mail.gmail.com>
Subject: Re: [PATCH] rtc: pl031: fix alarm support
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-arm <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jul 16, 2020 at 6:37 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Commit 75a472845196 ("rtc: pl031: switch to rtc_time64_to_tm/rtc_tm_to_time64")
> adjusted driver to the new API, but during the conversion a call to enable
> alarm irq in set_alarm() was lost. Restore it, what fixes alarm support in
> the PL031 RTC driver.
>

I posted exact same fix couple of days back[1]

--
Regards,
Sudeep

[1] http://lore.kernel.org/r/20200714124556.20294-1-sudeep.holla@arm.com
