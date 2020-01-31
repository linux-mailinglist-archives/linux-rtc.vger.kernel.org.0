Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5A9114E864
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Jan 2020 06:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgAaF1S (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 31 Jan 2020 00:27:18 -0500
Received: from mail-il1-f169.google.com ([209.85.166.169]:39317 "EHLO
        mail-il1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgAaF1R (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 31 Jan 2020 00:27:17 -0500
Received: by mail-il1-f169.google.com with SMTP id f70so5148837ill.6
        for <linux-rtc@vger.kernel.org>; Thu, 30 Jan 2020 21:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ayw2oXnrwzMC3d7v6ir2DBd5/HsFCESUxe1lINCb1uw=;
        b=ejwAnemiPab89371ob3uWPWOiKHFFp0huJyxh0U5C+5U1wpKtSaS+ZGgG0DDyWPKhr
         I0FF4t9Q3/GIsLzllbzzLVqqvHyie5VH5rDwF+l+/0sX39e6a69GofgnR+wxHjWN8ur3
         B7A5cH+s9qaPJO4Suhrz1UduBEYa+XJYagAahIm+w6SHmxWJrn6RK6lzs0gglTuhC0M4
         ckLDx9efVu+slXPECqJH+JnIHxstEVGLsYnmNxCAJ1v+mlQjPltG8kZ+XSWHygL/GyrI
         w1EB2AedSJxO/jWvmeDPSIlSQ+a8cjqaNtUM6fSBuuM0nMEmSK3lu/zTrizXrc7SzZrY
         5QYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ayw2oXnrwzMC3d7v6ir2DBd5/HsFCESUxe1lINCb1uw=;
        b=h8Lct9IEh1H69wOeGen6GoM+kb9g3T2s8zaLBIFrpuRiVvg4Hj+bvYujAIYbs07gFm
         0d7AwVcvXEBgVdn5FCUsxfDpTfXg8ZFBaMU3eC6TtJXEbmWpEkdqvy8fkeEfFmZBDThJ
         JkiFeXoKUTfuSF7xrniit2nlg//wbUy1TyyU/O4nWP9EAmIEnHCQalhsLf/eRB2rDPIa
         d5VEkf/YX+pS2wmjZ25aOUSyEQnu7NPwxRdiSGJLrCSW803p72XNZKsH5sbVh6R2wcNJ
         LrD5XSOeE02dIfx3IxJAbf29KQwGgvq0axqyUERiw6a8otDiDZsQxG6EYlZfnFZIRpPw
         BUPQ==
X-Gm-Message-State: APjAAAW2A8eyNOsBuBRPI9lOXmUxiAjO28vlKIHlO1xjRvPyl+rcWxJw
        W93hEQ1DaeOwZFEaP7P6WxRciizDuozTYgpABCJzKfSZ
X-Google-Smtp-Source: APXvYqxtcPUHTi7OtpI4M9FqaGpT84DLqJzG73GfkZamRD643NZxsAGslk087NZAhqUQHMH8cw8if8Ab3wBOqCKpr+E=
X-Received: by 2002:a92:d5cf:: with SMTP id d15mr1052013ilq.306.1580448435790;
 Thu, 30 Jan 2020 21:27:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Thu, 30 Jan 2020 21:27:15
 -0800 (PST)
In-Reply-To: <20200130144044.GG3583@piout.net>
References: <CAA=hcWQcVi79AW9aOSGQSzEwL-sPwvt=4zR+_25mJKvbkBON1w@mail.gmail.com>
 <20200112110353.GC1253990@piout.net> <CAA=hcWQoY95oPbLYyD306_wxmj=GU57t8m-m_kWwyy5-7Quj=Q@mail.gmail.com>
 <20200130104756.GC3583@piout.net> <CAA=hcWQaDrAHnLJXjcfvbL_+HkZraqfbCA70rfsD4i5kqXOqOw@mail.gmail.com>
 <20200130144044.GG3583@piout.net>
From:   JH <jupiter.hce@gmail.com>
Date:   Fri, 31 Jan 2020 16:27:15 +1100
Message-ID: <CAA=hcWQoacmPsi-VH3B1BGFHJhHi1a-tLaJXBiwAn03E7BiTiQ@mail.gmail.com>
Subject: Re: rtc rtc0: Timeout trying to get valid LPSRT Counter read
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On 1/31/20, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
>> So it was already included in 4.19, I don't need to patch it, that is
>> good :-). Sorry I am still not clear how to stop that error message of
>> "rtc rtc0: Timeout trying to get valid LPSRT Counter read", the
>> message says "To avoid kernel hangs, put in timeouts", I am running
>> kernel 4.19.75 on iMX6, where should I put in timeouts?
>>
>
> The patch is adding the timeouts, without them, your kernel would be
> freezing. I'd say your issue is the 32k clock.

Did you mean that is the issue of the hardware setup IMX6ULL for 32k
RTC_XTALI? That is nominal frequency 32.768 kHz for IMX6ULL EVK and
customized devices. Change to which frequency (64k?) can fix the
problem and remove the error message?

Thank you very much Alexandre,

Kind regards,

- jupiter

>
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
