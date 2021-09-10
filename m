Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDC04071AD
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Sep 2021 21:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbhIJTGv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Sep 2021 15:06:51 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:39271 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhIJTGv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 10 Sep 2021 15:06:51 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 8B5BF100002;
        Fri, 10 Sep 2021 19:05:38 +0000 (UTC)
Date:   Fri, 10 Sep 2021 21:05:37 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "jianbin zhang (QUIC)" <quic_jianbinz@quicinc.com>
Cc:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] rtc: Disable alarm irq if alarm is enabled and alarm
 time is less than or equal to current time
Message-ID: <YTusgJlMUdXOKQaL@piout.net>
References: <BN6PR02MB33324335E951F54DA1B00667E1D69@BN6PR02MB3332.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR02MB33324335E951F54DA1B00667E1D69@BN6PR02MB3332.namprd02.prod.outlook.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

Please format your patch properly.

On 10/09/2021 08:36:03+0000, jianbin zhang (QUIC) wrote:
> If device is booted up by rtc alarm, the alarm irq  will still be enabled and the alarm time is less than current rtc time before any alarm is set or canceled .
> 
> If device is shut down this time, it will boot up automatically as the alarm irq is enabled and alarm time is less than current rtc time.
> 
> 
> 
> For the situation that the alarm time and rtc time are equal to boot up the device, we expect irq to be false until another alarm is reconfigured, then irq becomes true again.
> 
> 
> 
> So disable alarm irq if alarm is enabled and alarm time is less than or equal to current rtc time.
> 

You should probably fix your driver instead of messing with the core.
From what I understand, you have:

 1/ set the alarm
 2/ shutdown
 3/ alarm happens, the device boots
 4/ shutdown
 5/ alarm irq is still set, device boots again

At step 3, your driver has to acknowledge and clear the irq

> Signed-off-by: Jinlong Mao   <jinlmao@codeaurora.org<mailto:jinlmao@codeaurora.org>>
> 
> Signed-off-by: Jianbin Zhang <quic_jianbinz@quicinc.com<mailto:quic_jianbinz@quicinc.com>>
> 
> ---
> 
> drivers/rtc/interface.c | 20 ++++++++++++--------
> 
> 1 file changed, 12 insertions(+), 8 deletions(-)
> 
> 
> 
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c index 9a2bd4947007..69ac54a50542 100644
> 
> --- a/drivers/rtc/interface.c
> 
> +++ b/drivers/rtc/interface.c
> 
> @@ -479,6 +479,15 @@ int rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)  }  EXPORT_SYMBOL_GPL(rtc_set_alarm);
> 
> +static void rtc_alarm_disable(struct rtc_device *rtc) {
> 
> +             if (!rtc->ops || !test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
> 
> +                             return;
> 
> +
> 
> +             rtc->ops->alarm_irq_enable(rtc->dev.parent, false);
> 
> +             trace_rtc_alarm_irq_enable(0, 0);
> 
> +}
> 
> +
> 
> /* Called once per device from rtc_device_register */  int rtc_initialize_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)  { @@ -506,6 +515,9 @@ int rtc_initialize_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
> 
>                                rtc->aie_timer.enabled = 1;
> 
>                                timerqueue_add(&rtc->timerqueue, &rtc->aie_timer.node);
> 
>                                trace_rtc_timer_enqueue(&rtc->aie_timer);
> 
> +             } else if (alarm->enabled && (rtc_tm_to_ktime(now) >=
> 
> +                                             rtc->aie_timer.node.expires)) {
> 
> +                             rtc_alarm_disable(rtc);
> 
>                }
> 
>                mutex_unlock(&rtc->ops_lock);
> 
>                return err;
> 
> @@ -827,14 +839,6 @@ static int rtc_timer_enqueue(struct rtc_device *rtc, struct rtc_timer *timer)
> 
>                return 0;
> 
> }
> 
> -static void rtc_alarm_disable(struct rtc_device *rtc) -{
> 
> -              if (!rtc->ops || !test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
> 
> -                              return;
> 
> -
> 
> -              rtc->ops->alarm_irq_enable(rtc->dev.parent, false);
> 
> -              trace_rtc_alarm_irq_enable(0, 0);
> 
> -}
> 
>  /**
> 
>   * rtc_timer_remove - Removes a rtc_timer from the rtc_device timerqueue
> 
> --
> 
> 2.17.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
