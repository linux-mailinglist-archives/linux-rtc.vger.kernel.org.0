Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906AD2B4EB1
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Nov 2020 18:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387723AbgKPR5x (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Nov 2020 12:57:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730857AbgKPR5x (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Nov 2020 12:57:53 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE583C0613CF;
        Mon, 16 Nov 2020 09:57:51 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id t18so8790050plo.0;
        Mon, 16 Nov 2020 09:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7uMqsrJx2g4zNTohVFMIH9gH5XdsIvDi/J9ZISmamSE=;
        b=fi+vh4UaWRI46reqGvWvDUNpMkeZo5TubfVqfsYVhWLvZVK1rJZRtfOEPDEQM02ID6
         Tl8nQhkTaNGXZDbmdgzIV2skDricGR813z+5XfzGNAaH3yyZ8Cz0lwp59RSOmpoBcTQ/
         6Kr/VdvcsP0bJFYtHgVEFw4hwvjkfXUVCgNBBDGw9mZLtWwRAACw4iKQeC2y4SpQbqe7
         VdUSe52EpEeQzlnIn/E1xzOxX/F+pS9CIn7uvZfLrZX9wKAlUUtKzdMsGSZVaDHNTp8Z
         uxflY0YlF+5K8p+tkFghMgWTYOul0YX7EeoZSEa+rL/AVfunRzTtB1ko0D9uWEMpY6/k
         zaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7uMqsrJx2g4zNTohVFMIH9gH5XdsIvDi/J9ZISmamSE=;
        b=VpfRndQbroWc0yCQTkaObUhXXOpHoph2Ia1KmaP+JvqVzF34aoyv5ixqnF12cIAL05
         jL4PIZxsK8HMgBCscdP2abvVQL8NPE/uvhNYfkf0qYYRKBtlQS0MsZ1d6/LuEFm+Q8z6
         FH6TszB6WGqi6o/cXJxlQW/n/n5vRPc4LcHd6cTMstt9j1+qKdDxiQW2qE+HN1kKFJgl
         joS3HkHumTswKzvhvZIbsWrGQvbvlXI+vu7PfA6Fb0sX/hA95L55VOxlmf1aTQg/ZKzU
         rOAKhjENIB2sSMjAhcXbfzNp6WzcIS24VsEyPFbIu+ZiPDZ06kVNTOa+hml3zCC42oCG
         /BxA==
X-Gm-Message-State: AOAM532JjPXFKVlwEHgVwW0+BIZbIyF95bg4VoTyr7whZ3NqKhXuy8LH
        3WFVT+wu0EhVrS84W1SDab8pi8Sw/lHTL4t+4nE=
X-Google-Smtp-Source: ABdhPJzCA6ZRtF6o1tpWN2AGCUoAW9JqkYONViS50iC9xNeLwbXHKZir6+94+GCm5noz/q0QI4fMOhq4AGizL+WU+PQ=
X-Received: by 2002:a17:902:aa8a:b029:d3:c9dd:77d1 with SMTP id
 d10-20020a170902aa8ab02900d3c9dd77d1mr13760767plr.0.1605549471233; Mon, 16
 Nov 2020 09:57:51 -0800 (PST)
MIME-Version: 1.0
References: <20201112130734.331094-1-ch@denx.de> <20201112130734.331094-2-ch@denx.de>
 <20201116144343.GA1689012@smile.fi.intel.com> <20201116173617.GV4556@piout.net>
In-Reply-To: <20201116173617.GV4556@piout.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 16 Nov 2020 19:58:40 +0200
Message-ID: <CAHp75Vehwi8xzSBn_9Qa_SHF3ZCVGTBnsDmv6vix49vGt1wQhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rtc: rx6110: add i2c support
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Claudius Heine <ch@denx.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Henning Schild <henning.schild@siemens.com>,
        Johannes Hahn <johannes-hahn@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Nov 16, 2020 at 7:38 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 16/11/2020 16:43:43+0200, Andy Shevchenko wrote:
> > On Thu, Nov 12, 2020 at 02:07:32PM +0100, Claudius Heine wrote:
> > > The RX6110 also supports I2C, so this patch adds support for it to the
> > > driver.
> > >
> > > This also renames the SPI specific functions and variables to include
> > > `_spi_` in their names.
> >
> > As practice shows this is not the best approach. Can you ratqer split it to
> > three modules: core, spi, i2c like it's done in many other cases (esp. IIO)?
> >
>
> Actually, I'm fine with having everytihn in the same file because
> separating everything out means having 3 more files per rtc supporting
> both busses in an already very crowded folder. And I don't think being
> able to remove support for one or the other holds any actual value.

Good to know your opinion!
Since you are one who is looking after RTC stuff I'm not insisting on
my proposal.

-- 
With Best Regards,
Andy Shevchenko
