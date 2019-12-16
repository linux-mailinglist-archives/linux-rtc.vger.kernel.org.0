Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5C31209B2
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Dec 2019 16:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbfLPP25 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Dec 2019 10:28:57 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37376 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728285AbfLPP24 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Dec 2019 10:28:56 -0500
Received: by mail-wr1-f66.google.com with SMTP id w15so7799796wru.4
        for <linux-rtc@vger.kernel.org>; Mon, 16 Dec 2019 07:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=fAdhkG2e5jez4uCUP2cd8gWid6BcZh3e46uIq4uaFno=;
        b=dfdrhxvLs+qkSYfGV25KfTDTG9pOec+MCOCWCfVxsU9Lt2vVQgPyPSq4L+q19dA3cs
         /zqvASvK3n6Yu/cGiqhjKtFNVAtwflGUm4DK45R7rClCFgidL85k5SZzx5mkvHUPGKGM
         CM1s+tVvZoVEP4aueikXRru3RO4gbq0arI7CWneBF4JfWcXtaK8vdDTZbcxXq/sfkhz9
         V/pwJhdpsO+IJLegguMC/Lk9RhWmUKNKPWS14PV3ENMVkk31ftHIqmuZOwd/tcapC+LG
         zqaMkh5NfDLFviy8pDMVehVN9zuw1yNqX1Rs7hEcbuH9FBz6Kz62im1BTZc3WOLhgdOz
         JipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=fAdhkG2e5jez4uCUP2cd8gWid6BcZh3e46uIq4uaFno=;
        b=tGHiVz/73gCg+v2GP/sduztOM2T2TBImiQHDoN8MOz+s8lxAHNlFqzf9AJZ+509Szo
         qQ32gMdrYrAvX7WCyzyQ6gERP14QcgufrmuO/n5of3aruRW8hXu1xZ752jf70NVu+8A5
         xRaYnkBZy6DGtzu7G+tjLpXE806jHZQeWZt8RuzrXuHprargwcqQNG5Ibh1g9RB4SYxg
         sczoVQyAG1WYDZm3Cxrri8148SJu6gllG6R+ncdiZyHeVjvk/KzhF42jMg+ZuKX3uRdr
         it+b7xyMIWHEmjDp1wGqMJV+oT237iJuSUCRriEFBVSziQQ6go6yUKUg6OZ6uJEKfgTS
         bmFw==
X-Gm-Message-State: APjAAAWd1GOziPwisgBABiu49nydX6HdvRTbT7gm3pBQTmKNH5sYXCw3
        OEK016B/9oYgqjoCWvUa12E4vQ==
X-Google-Smtp-Source: APXvYqz8QkLm1tBQdJ5TBnQi20sHKdJO2QnHprE3jkORnRm65QppibHKCSyO8Izjl2dcJjeKoRAuSA==
X-Received: by 2002:adf:81e3:: with SMTP id 90mr30636842wra.23.1576510134854;
        Mon, 16 Dec 2019 07:28:54 -0800 (PST)
Received: from dell ([185.17.149.202])
        by smtp.gmail.com with ESMTPSA id 4sm20980480wmg.22.2019.12.16.07.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 07:28:54 -0800 (PST)
Date:   Mon, 16 Dec 2019 15:28:53 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v4 3/5] mfd: rn5t618: add RTC related registers
Message-ID: <20191216152853.GJ2369@dell>
References: <20191211215409.32764-1-andreas@kemnade.info>
 <20191211215409.32764-4-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191211215409.32764-4-andreas@kemnade.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 11 Dec 2019, Andreas Kemnade wrote:

> Defines for some RTC related registers were missing, also
> they were not included in the volatile register list
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> 
>  drivers/mfd/rn5t618.c       |  2 ++
>  include/linux/mfd/rn5t618.h | 11 +++++++++++
>  2 files changed, 13 insertions(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
