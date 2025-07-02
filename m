Return-Path: <linux-rtc+bounces-4407-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16644AF5B4D
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 16:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DED3B1C42820
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 14:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09913093A1;
	Wed,  2 Jul 2025 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="R341aV8Q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ADF307AF1
	for <linux-rtc@vger.kernel.org>; Wed,  2 Jul 2025 14:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467255; cv=none; b=WC1crwJZx5wGW79pFcOLfnBPT1bcKF+HXbQIMvkN2t6mpvGpKycUzvIZzEp360h3bF0DTiA6Nf3+5Q5ayDyBtB5Hr6+FdZf4YBpXLfFjzqV3cr07su1le0Y6ooshKizSTr8haR+Y3t6eQ/myzj9pbNPmnpXU6tFsUTrFV7Y6/Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467255; c=relaxed/simple;
	bh=iVHMHjey2MNE41Mhu0E5GtBHJGyxsabbICgb+nwHSMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKCq67+B6nEV8DUzO+gGiKiWxa3V6pd4StMWj+HseMHpdjQNP1jH8ZSV6eDfGTl+Z7VzTKhl/1lL9oKBmFdlR/RYcYiRJKZWVBgREgTJTAQ6OlcNEBEwa3xYFI/XUVOsLhBbvjPm/LwvAmQyBwZIYyhaML+SJMAapetVHd33oeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=R341aV8Q; arc=none smtp.client-ip=62.149.158.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Received: from [192.168.1.57] ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id WyajuG21xmHkSWyajujv0o; Wed, 02 Jul 2025 16:37:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1751467062; bh=iVHMHjey2MNE41Mhu0E5GtBHJGyxsabbICgb+nwHSMo=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=R341aV8Q97hZxsxZthlDX7PD36H8OFPPeo4v4lPf0yqe5+dxaRbVonDiqe4hZGPga
	 Wv8udZTCQkiz4vj43/noZCualKaCDwMkTacinePnI7bHlpS15waiWEsR7KFoCMlHtu
	 d5ea0lq3YACMf2b915IZG2YluaFelik84qm0XpQqTKzQAH3cYf/uPDlXd+R291jW8D
	 0L1d3kSuJ+5j1EobsLXiqWD86WS3PfCLbSL/PK3PZGqcztmXRt929XSPxHWYq+PY/H
	 3L/BfVv69tBZlmiJ56Q5v6YVAjEqZZHFrH4znuHJ1qJSyPF/e5nS9rrMPmzG4jgq/r
	 RDRiTG7SY2Fow==
Message-ID: <91ea3b14-20c5-4e5b-a88a-206748a6d36c@enneenne.com>
Date: Wed, 2 Jul 2025 16:37:41 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Expand oscillator stop flag (OSF) validity check to
 ds1341
Content-Language: en-US
To: Tyler Hicks <code@tyhicks.com>,
 Meagan Lloyd <meaganlloyd@linux.microsoft.com>, alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1749665656-30108-1-git-send-email-meaganlloyd@linux.microsoft.com>
 <aGMVtfwB5gmBuW4T@redbud>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <aGMVtfwB5gmBuW4T@redbud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLSFNQXFvQ0eYwrsDBdrlJebgl6jfsRd73w9K4CkWYzbl0bTjJnStRZK5ay/ZOY4wIZGQ/Rl/S/k1O7pu/0ZZilQGV0NRhxfzAOL1PMB5b3g3TLVuDe3
 XpNtFlyqRQgsWWEinEFKk8SlNhAThb4UFawN4+rs5oD5Uod3CVws/m9s6ljoYFOuD5LPYLRcUSMDgQ4nh8YijiWeDY1I7ZAGpIVObAGHWbQCaoxRQNCOEnh3
 Klr78EfL255Yzj2Pmv7K9AUT7zKaWUBs7PFbTbELPoXUqcUnGMczzd05W4hkQp521H/hayRhc49TZeoWzk7WqCJCRfGQNqmC3hRwhp13nDKs62HfZeeClcgy
 IwUKzUWf

On 01/07/25 00:54, Tyler Hicks wrote:
> [Adding Rodolfo Giometti]
> 
> On 2025-06-11 11:14:14, Meagan Lloyd wrote:
>> We would like to use CONFIG_RTC_HCTOSYS to sync a supercapacitor-backed
>> DS1342 RTC to the kernel time early in boot. An obstacle is that the
>> sync in rtc_hctosys() is unconditional as long as rtc_read_time()
>> succeeds and in some power loss situations, our RTC comes up with either
>> an unpredictable future time or the default 01/01/00 from the datasheet.
>> Syncing a future time, followed by an NTP sync would not be desired as
>> it would result in a backwards time jump. The sync feature is useful in
>> boot scenarios where power is maintained so syncing only when the RTC
>> data is valid would allow us to make use of the feature.
>>
>> The DS1342 has the oscillator stop flag (OSF) which is a status flag
>> indicating that the oscillator stopped for a period of time. It can be
>> set due to power loss. Some chip types in the ds1307 driver already use
>> the OSF to determine whether .read_time should provide valid data or
>> return -EINVAL. This patch series expands that handling to the ds1341
>> chip type (DS1341 and DS1342 share a datasheet).
>>
>> These changes enable us to make use of CONFIG_RTC_HCTOSYS as they
>> prevent the invalid time from getting synced to the kernel time. It will
>> also prevent userspace programs from getting the invalid time as the fix
>> cuts it off at the source - the .read_time function.
> 
> These two patches look good to me, although I'm not an expert in RTC drivers.
> I've reviewed the DS1341/DS1342 datasheet and the approach that Meagan has
> taken makes sense to me given our (Meagan and I work together) desire to use
> CONFIG_RTC_HCTOSYS and the need to avoid syncing from an invalid RTC state.
> 
> I've added Rodolfo because he first added the logic to clear the Oscillator
> Stop Flag, during driver initialization, way back in 2007 with v2.6.23 commit
> be5f59f4b67f ("rtc-ds1307: oscillator restart for ds13{37,38,39,40}") and may
> have additional context to provide.
> 
> Alexandre and Rodolfo, does this approach make sense to you? If not, do you
> have any other suggestions on how to make CONFIG_RTC_HCTOSYS work with this
> driver? Thanks!

They look good to me. You can add my Acked-by line to all of them:

     Acked-by: Rodolfo Giometti <giometti@enneenne.com>

Rodolfo

> Tyler
> 
>>
>> Meagan Lloyd (2):
>>    rtc: ds1307: remove clear of oscillator stop flag (OSF) in probe
>>    rtc: ds1307: handle oscillator stop flag (OSF) for ds1341
>>
>>   drivers/rtc/rtc-ds1307.c | 15 ++++++++++++---
>>   1 file changed, 12 insertions(+), 3 deletions(-)
>>
>>
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> -- 
>> 2.49.0
>>

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming


