Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C485414D53D
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Jan 2020 03:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgA3Cg2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 29 Jan 2020 21:36:28 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:33051 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbgA3Cg1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 29 Jan 2020 21:36:27 -0500
Received: by mail-il1-f195.google.com with SMTP id s18so1797067iln.0
        for <linux-rtc@vger.kernel.org>; Wed, 29 Jan 2020 18:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=w+fsHbx1jaL8n9Q/6rh8nO7PaLHOadiBCGXvvJfw8H0=;
        b=L9iCn4v88zplXnvU4fq0hVmscrYf8dk+l7H0wwnj74/OtbUOa2mhMm/SYyRJqlPXqL
         owlZcd9VBM673H0A5zv5z5XV2mJQ1qZtRUV4+nfwrJGj2bZXT3W7sz0MUGTZumVDqkr6
         r4EoDkwDGxIJuSBkKeWCKBPhPZD79R+v4SZa1Z0u3BUsVlGbLdVLk+4GtKbjUZ1CGZqb
         P/dkl/JWvAvNU8i1DXOZfn1OZ8jM00O0eHQDd98QwVVKCCgn/QvATKqqsWcV24lRiEAj
         CFnFJiWOnfRuXyA+b7QDSkYudB0yqqvutbkdVYnUS/C6KFt2VNdE5kGA7mCwq+bskUa3
         A8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=w+fsHbx1jaL8n9Q/6rh8nO7PaLHOadiBCGXvvJfw8H0=;
        b=PYbNi/p+tQdzVfvXlICWLUmkFdCyDet0Qoi9Mr034A9ZIyxgNC9c6QrbgActDSjhcp
         FhAAaUERkMeFs2LR6wdQglZmTkDtLD3OGdVIHSBcFSLAXocDdyRgFktjQMv09iinPp3z
         iCrooow7Rv/qAO2ywk4fmukpcEE+aoaXJJOfX6F1GcRhzR2IQfpInwKQ+hX4UxXqepGJ
         4LJcqDzZcQxqnk8Cg752b4DCZnX85nQ3YpZXqyQLw36bKafTVVoYEPYodowjKheWOzBF
         HVVPrLldK6q3WKjUsKRxTQ+n3yvq75GBpjfrtGHh2QrVbHwQhfjeT5wKFCSXsm0OU7VJ
         M5Xw==
X-Gm-Message-State: APjAAAU78M8CqjvlzHNvxRQEeoscVpdquq0RUdINmbNeMmuf3ielmgy9
        oL5GrKjElJeHLuKsaoUhxrSyKqJtt+E1o6kbJdo=
X-Google-Smtp-Source: APXvYqyreFsWO0kv2rKlkYZd+LGRLSBG9DZDWfCwV36MguHrq2RsjMyBAKmHQaWwm08QBJNmhpodwUH8y/3WaiPR9hY=
X-Received: by 2002:a92:ce85:: with SMTP id r5mr2382335ilo.301.1580351787191;
 Wed, 29 Jan 2020 18:36:27 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:ee13:0:0:0:0:0 with HTTP; Wed, 29 Jan 2020 18:36:26
 -0800 (PST)
In-Reply-To: <20200112110353.GC1253990@piout.net>
References: <CAA=hcWQcVi79AW9aOSGQSzEwL-sPwvt=4zR+_25mJKvbkBON1w@mail.gmail.com>
 <20200112110353.GC1253990@piout.net>
From:   JH <jupiter.hce@gmail.com>
Date:   Thu, 30 Jan 2020 13:36:26 +1100
Message-ID: <CAA=hcWQoY95oPbLYyD306_wxmj=GU57t8m-m_kWwyy5-7Quj=Q@mail.gmail.com>
Subject: Re: rtc rtc0: Timeout trying to get valid LPSRT Counter read
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

Thanks for your response.

On 1/12/20, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> Hi,
>
> On 02/01/2020 19:40:10+1100, JH wrote:
>> Hi,
>>
>> I am running kernel 4.19 on imx6, could anyone help for clues what
>> that error is about? What I could be missing and how to fix it?
>>
>
> I'd say that you have an issue with the 32k clock or tamper detection,
> have a look at this commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cd7f3a249dbed2858e6c2f30e5be7f1f7a709ee2

Is that a patch for 4.19.75? Or where can I download the patch for 4.19.75?

Thank you so much for the help.

Kind regards,

- jh

>
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
