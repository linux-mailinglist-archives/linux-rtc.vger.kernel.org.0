Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9A93774A8
	for <lists+linux-rtc@lfdr.de>; Sun,  9 May 2021 02:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhEIAHS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 8 May 2021 20:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhEIAHS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 8 May 2021 20:07:18 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E1DC061573;
        Sat,  8 May 2021 17:06:15 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id v13so10967268ilj.8;
        Sat, 08 May 2021 17:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3nk5otuuvpQdd5V63KbzQrvfCEVv6aZKunZOJD4xz+Q=;
        b=EVD6P7md3BCemopGoXFblj0Li3O8zld2a65mjbKBWDCLt3m5dn1hDXUJ9o7Jhj6Add
         WOpj9+ppOm2mZtzubG/2UYiFyDwsjpTJn+tw7GqNuGUmfRndU448KnS9ep9qcQEy3hiI
         wmACAKWfkiyKxh/Vy/USXsEz6Xn/1xIXyYjwRa3fiBUrFnMb1UobFN5K3QAA3icOAGGo
         B0Lu7Ueg1FM4B13BWYU/YyugfX2qJ3DERqOkl85GdLCT+t0EkJUiTjHSs/FOyzhyVM5M
         p5HDkdoz8/3fnffNCWhXXye0gxSDoqJ8P7axFAZwVFpxO5l6qs89wrwS3CxAMQQ/GCAe
         rIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3nk5otuuvpQdd5V63KbzQrvfCEVv6aZKunZOJD4xz+Q=;
        b=T1AFyFjg93wQcIkaWl5I1hrzn1z/DPN4SaslBRmyoYsQ27I+D++kdt8btamHDCwwhq
         5PKmrMI29DB7O4NAbxUzGgD3IDmBNuu09+t4o9TUpwqN8rwC5yTNn4Z3Hgmu2UDhK7Kq
         UmqRrYmyYSceEy3E+DW0zdvb0P2MSGJZ+jkvg7JKgiKEuBxuBd738AjrcJvlIHNwtqyE
         0BcGXucZSCUJ+PpSoIjjUVjdJSko3tM3bwUnViEG1vCRqY3o0KuNdRlX99vkLCBsZpLJ
         wTHo8i1ubKTNFBaeUuOMTMOEsHW716wuZD/7gtd3NInaCCubBTZS2r6RV+/AEjMUFXXi
         u1oQ==
X-Gm-Message-State: AOAM5337jydBXNb17QvOetlgsn893VXKLWDo87g+ilUlEVVr6vvYJ5gu
        NuGfgiTA5Ewxotriwv/vyLJ2aHtzI0XES3fq0vg=
X-Google-Smtp-Source: ABdhPJxWMfurobgFPi+t5kxWyMseS0+8/Aks0PQM/fu9bT8ipMsNtEr5vCp+SHyznEsWmy4Hdslz8pMW3iNmq0BnWIQ=
X-Received: by 2002:a05:6e02:20ce:: with SMTP id 14mr15581662ilq.102.1620518774641;
 Sat, 08 May 2021 17:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <a6b23ee8d3ea78f62d3fda0b53aa273718f14c6d.1620452523.git.christophe.jaillet@wanadoo.fr>
 <CAOc6etaUPtJqoH9DBDE72nDW7s7iEZHnaJRpKx9zFow02WOZig@mail.gmail.com> <9f34ebcd-0c17-cd7f-eb08-52c6c3dc7b03@wanadoo.fr>
In-Reply-To: <9f34ebcd-0c17-cd7f-eb08-52c6c3dc7b03@wanadoo.fr>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Sat, 8 May 2021 18:06:03 -0600
Message-ID: <CAOc6etYwTvVPnoB3BQfuQEikvsCwSs9AqBWnLFrs9zQ0pJGp1A@mail.gmail.com>
Subject: Re: [PATCH] rtc: max77686: Remove some dead code
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     cw00.choi@samsung.com, krzysztof.kozlowski@canonical.com,
        b.zolnierkie@samsung.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, May 8, 2021 at 10:59 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> >
> > Following the recent conversations, I think it might make sense to do
> > dev_err(&pdev->dev, "Failed to register RTC device: %pe\n", info->rtc_dev);
> >
> > Is that right?
> >
>
> Yes, it is right, but it should be done in another patch.
>
> Would you like to give it a try?
>
Sure, I'll have the patch ready to send it when I see yours on next.
> CJ
