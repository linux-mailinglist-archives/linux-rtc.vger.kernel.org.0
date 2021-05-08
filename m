Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 016D6377273
	for <lists+linux-rtc@lfdr.de>; Sat,  8 May 2021 16:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbhEHOjr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 8 May 2021 10:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhEHOjq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 8 May 2021 10:39:46 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FCAC061574;
        Sat,  8 May 2021 07:38:44 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id l19so10201653ilk.13;
        Sat, 08 May 2021 07:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MZYaBypPGzWypcDz+RJ/92Ib8rkc/cBWvMxSsGfkW+k=;
        b=D3/aQyfp8t7ogWUaX4DRE6YvqooLIvoM/ckyPIoqkrZHNXcM2EqOXu1QAHjTG7fVIf
         kmhqXdpkUYYyz9TuB6QdQj2kfPmeLEVp1f/8X0S5OIYcuy03pTC6MP2haGf6MztfCB8R
         TfjhBHaC69s0fEsdoImJki0XbAaFl7XYDkm6JrlIMD5JwU8scWrfnZ1X5SeoQzzhK7+I
         CliwvA2Dwtxo9fpzoYIMeOr2O1ZQrIXE7Ktw6lJ7iP252PKUH3NtokoJ6xAyNfQN0RKU
         a4+rj1F2+dax6kIn+QjT59BuDO/UN3QajHe1w1DkCsQ2o64fKqSHMhJwin7YdOlCrTu/
         cu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MZYaBypPGzWypcDz+RJ/92Ib8rkc/cBWvMxSsGfkW+k=;
        b=NuEvFvpBOQBOfp5en2z/tpr9JkwQFuFKrpW1UCu1tpMhDLmOVMGtsmaRmesLHA/pxz
         Mn4YHYpsSYyYmWsxBX8rJ8JyXkE4gu9ZxXddZjdeRuYZk/smZQ/qNcNMJsXG3Pl1O6Ag
         cDnlCorp5FQz2qTFA4aylutMr4M2+6ixMdPsOF5kvrT1XjIQv6UrurHWLGHq9fYtFxvn
         mM4DpZH/5H3fXM8mZxXOzLDQ3t70aN4KKgBFcaFY2clMIeRkdQEKa0fdzAZA18Zn/1nS
         LTgTJ2IEcwMLF2p1rbInvBvwA3OQmdThas/d9v57Ud4JVN5+4vroS8SYAxPTEaKvN3Ow
         V1gA==
X-Gm-Message-State: AOAM533dVu9IvLCEnFnxRXAS8JNcFghSeg6NLyhAt5CjxRWKl5tT7Ze0
        tpKr2Q9We2wClevwPuY4bc/Z3rFZxAenIS2KVZj480w9oezOJQ==
X-Google-Smtp-Source: ABdhPJwUvA3thyatHn3dd/9MJu3e1ABd2WdkeQ/tylIxI6HW7OQPWyI0vfmU59iDWaxLTYwuUHC8WS0qVtt6CNawyhg=
X-Received: by 2002:a05:6e02:20ce:: with SMTP id 14mr14078108ilq.102.1620484723400;
 Sat, 08 May 2021 07:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <a6b23ee8d3ea78f62d3fda0b53aa273718f14c6d.1620452523.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <a6b23ee8d3ea78f62d3fda0b53aa273718f14c6d.1620452523.git.christophe.jaillet@wanadoo.fr>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Sat, 8 May 2021 08:38:32 -0600
Message-ID: <CAOc6etaUPtJqoH9DBDE72nDW7s7iEZHnaJRpKx9zFow02WOZig@mail.gmail.com>
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

On Fri, May 7, 2021 at 11:43 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>         if (IS_ERR(info->rtc_dev)) {
>                 ret = PTR_ERR(info->rtc_dev);
>                 dev_err(&pdev->dev, "Failed to register RTC device: %d\n", ret);

Following the recent conversations, I think it might make sense to do
dev_err(&pdev->dev, "Failed to register RTC device: %pe\n", info->rtc_dev);

Is that right?
