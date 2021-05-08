Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88602377346
	for <lists+linux-rtc@lfdr.de>; Sat,  8 May 2021 18:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbhEHRAb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 8 May 2021 13:00:31 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:31599 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhEHRAb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 8 May 2021 13:00:31 -0400
Received: from [192.168.1.18] ([86.243.172.93])
        by mwinf5d16 with ME
        id 2GzR2500221Fzsu03GzRHm; Sat, 08 May 2021 18:59:28 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 08 May 2021 18:59:28 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [PATCH] rtc: max77686: Remove some dead code
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     cw00.choi@samsung.com, krzysztof.kozlowski@canonical.com,
        b.zolnierkie@samsung.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <a6b23ee8d3ea78f62d3fda0b53aa273718f14c6d.1620452523.git.christophe.jaillet@wanadoo.fr>
 <CAOc6etaUPtJqoH9DBDE72nDW7s7iEZHnaJRpKx9zFow02WOZig@mail.gmail.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <9f34ebcd-0c17-cd7f-eb08-52c6c3dc7b03@wanadoo.fr>
Date:   Sat, 8 May 2021 18:59:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAOc6etaUPtJqoH9DBDE72nDW7s7iEZHnaJRpKx9zFow02WOZig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Le 08/05/2021 à 16:38, Edmundo Carmona Antoranz a écrit :
> On Fri, May 7, 2021 at 11:43 PM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
>>          if (IS_ERR(info->rtc_dev)) {
>>                  ret = PTR_ERR(info->rtc_dev);
>>                  dev_err(&pdev->dev, "Failed to register RTC device: %d\n", ret);
> 
> Following the recent conversations, I think it might make sense to do
> dev_err(&pdev->dev, "Failed to register RTC device: %pe\n", info->rtc_dev);
> 
> Is that right?
> 

Yes, it is right, but it should be done in another patch.

Would you like to give it a try?

CJ
