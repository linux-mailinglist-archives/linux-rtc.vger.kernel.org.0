Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC07243982
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Aug 2020 13:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgHML6V (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 13 Aug 2020 07:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgHML5j (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 13 Aug 2020 07:57:39 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8049DC061757
        for <linux-rtc@vger.kernel.org>; Thu, 13 Aug 2020 04:57:38 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id o23so5875117ejr.1
        for <linux-rtc@vger.kernel.org>; Thu, 13 Aug 2020 04:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5RB1WoyMyCWSjfADtPoQdYe5l/iqp0SScjPm7FG//RU=;
        b=qCIhK/y2+JLkP41bc/K/8sVComsJCF6FzcEBY/ItGpOb+GrCcd8dFa0QgxtlcoaFJL
         hWBdQrkNoc86RoJPDP92sANOPiVKQLEY0wWra3ahOMDL+306sIUjTY3tXX5BDGfBYHWS
         uyciuHYZWS9bj+EFlKxKW3eGslQzyirS+BNUXsdrhsTKF5+amYOTruUiF1is2R3Lnbyf
         2vdijzrELBmrp4p8KP/h5WNefBTm7H7TfRTv3W7zdGBWJaK0ZDU5Xu318yzzEI/pWzNf
         gnnTUhsUGTFDl6Kjl+WoWffAnKJS7VVVCiY0mifJ4HjdBA53UIwwtAfrcVBugowLqCnD
         xUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5RB1WoyMyCWSjfADtPoQdYe5l/iqp0SScjPm7FG//RU=;
        b=LrROI/LTkPEp6WmWZVQ7FpY6I+6cmpf44c8+Mrq92Gr7umSGqYYoeLrxPR+QIbx9K/
         FbAuIYWjFa062T3ns9Csq3WLLfi0HfiaDA2CPjT0cLybsRRf5QWkbGg9J69kgbPbBhkE
         +y2RcRqSqxg2JvehgPub1UjZ8r5YwP+USkrC7xLu5w3XFjUEctvu0q/JN7akVhIOT0Cc
         GW21ko4NWRgWHhXStzQvDUh1p1XZasW9Q4o39TqV/Yv8/eHZDqF5L/NPgkMlKcznHSXc
         EtwNtiJuNsK3ebUmSU+Wn4dBBYA3XpOuWlOUkvyLDHa8QRT5ReMDg4iwOt44PMCTD2jP
         Cslw==
X-Gm-Message-State: AOAM5322ZwEwAsCDdGtWWGVvHOhImmu0YoZnjfv9NtfaqTq3aKfQ21CC
        MASALznKO/5/A3x91wlhEL2R/L4Kc5OZ/IgXEudRL64pChg=
X-Google-Smtp-Source: ABdhPJy6SQa/Tkr0wJF+E8vE9LDgclccIzQ6lTyrMY26xnDfgVHJjraFLEK64JVS9XoDHDEYWvVnwPzVsHgGoRAwmm0=
X-Received: by 2002:a17:906:f8d9:: with SMTP id lh25mr860590ejb.458.1597319857207;
 Thu, 13 Aug 2020 04:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <1597317268-19537-1-git-send-email-amittomer25@gmail.com> <20200813113906.GL3480@piout.net>
In-Reply-To: <20200813113906.GL3480@piout.net>
From:   Amit Tomer <amittomer25@gmail.com>
Date:   Thu, 13 Aug 2020 17:27:00 +0530
Message-ID: <CABHD4K-fQbANVvWfrswdJULN72ahRbPeVGX1Z65bAZTRcJCU9w@mail.gmail.com>
Subject: Re: [PATCH] rtc: pl031: enable rtc alarm interrupt again
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Aug 13, 2020 at 5:09 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi,
>
> Thank you for your patch. However, this is already fixed upstream:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/rtc?id=4df2ef85f0efe44505f511ca5e4455585f53a2da
Sorry,  my mistake.
I checked out from the 5.8 tag, and this patch was missing it seems.

Thanks
-Amit
