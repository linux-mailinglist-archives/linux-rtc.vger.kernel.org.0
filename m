Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13F3B17BF70
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 14:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgCFNpU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Mar 2020 08:45:20 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46623 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbgCFNpT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Mar 2020 08:45:19 -0500
Received: by mail-lj1-f195.google.com with SMTP id h18so2221856ljl.13
        for <linux-rtc@vger.kernel.org>; Fri, 06 Mar 2020 05:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7HlHInjFMccqDiZAW2h7dIR71BCrB+D8mPZu9+j1MN8=;
        b=FHQ6qk5hqbD2qhFvRgZ3LVpYdSyWjhuFzo8kQy9oW1+AW/vDKIqTBYC8mb4BrjqzYu
         PUKHoxlds59gjOrwJZgYpIHlwyEpf7y2889eDr7CF8k4uM4yxFCVaq71Wml0/0xz+dWG
         U8wChxbMKfNDhuI07VZcoqEEFyNrO3A80u58UScYrMHiIxQoP8so8W1+tKRMouzGeY6X
         V0/OBotJRq7p0VlH836pIjR5s+msoqEWcnjd8EQ5sywecQBNKfrnW1Jpfp2XUsXtXd0e
         GW5JF5yMarrByddEEJO9zne6E6EVIbnJUvPpZVQUgFHoHw9RLlA8oOy/jTh5SyiBt5Sw
         i+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7HlHInjFMccqDiZAW2h7dIR71BCrB+D8mPZu9+j1MN8=;
        b=Uy71TS3HlaX9yYXLncKIGPUXIwguFKHY1zGAPy/qMmBuN3604cUpUNEDcRj4QpBmx4
         wk10U5OL5NHbnjAL7YdjmA0vaCJgpgMsH93e7q067HISjSK83WC73IYX31wpxYl45cKF
         i3RoUuGK215OLf0Ts0nuXRRMCgnwWf3BFN6zK7oOfocLZe4FtQBqXf2qOXt9LxpkCCE1
         2wpwFYP3o5Kzl4Hd7EwDA6gd/LgFrPk9tQLaDI1MPorjj4nK4EWzE5JUSLCE2HeOm/Kk
         LBxTU0oBOzvY+Lp2b6VlQzgyPksHEd+520FemFaj6309lDsR4uA32IbpsWN+kwMyWAiX
         aQZQ==
X-Gm-Message-State: ANhLgQ3wmbW5YfRs+IkT3MVrVHgCuoACkYGQuOxboUMu6YT72p2azURm
        JvmYmrD3sqLGtf3Ky47p2Cn5p3IOtcVOScIGbsOlaqXn
X-Google-Smtp-Source: ADFU+vtS4etaU8JF15tZD3Ix13FzFgX9XaRY1ceFufTOGBQl3SOmzB3BGAdD+9bvpxp6KQsusW0FzkuQaZihBrzNwzY=
X-Received: by 2002:a2e:b169:: with SMTP id a9mr2039334ljm.258.1583502317443;
 Fri, 06 Mar 2020 05:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20200306005809.38530-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20200306005809.38530-1-alexandre.belloni@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Mar 2020 14:45:06 +0100
Message-ID: <CACRpkda3DnsoYQSwrny2iS-vx2VmqzdwhBjuNXb6KNUwp9zc5w@mail.gmail.com>
Subject: Re: [PATCH 1/3] rtc: pl031: remove useless invalid alarm handling
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Mar 6, 2020 at 1:58 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> The core will never pass an invalid alarm to .set_alarm, it is not
> necessary to check for its validity.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
