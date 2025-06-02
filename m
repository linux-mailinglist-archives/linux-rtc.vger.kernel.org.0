Return-Path: <linux-rtc+bounces-4214-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B10ACBC0F
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Jun 2025 21:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D5933A35D7
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Jun 2025 19:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB591ACEC7;
	Mon,  2 Jun 2025 19:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="gb16/+RV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9928801
	for <linux-rtc@vger.kernel.org>; Mon,  2 Jun 2025 19:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748894384; cv=none; b=Bqjj+l3I6l/Qe0JpEgWu/h/hog/3jNubmkkNtz1rmpmdoWy3CwceUqLIpw9+sOGBTWx3TBkLU6n/il8SxO3TKy1/BrGwfgoeE+ciFn6gSE8yIPhygh5RPokq4mJ3+n2QNKa8kZ2QgwVwqZn5qvGTU6YoY6rAhc9hmDx3ONmZ3Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748894384; c=relaxed/simple;
	bh=Fcz640mvj6gMj4rgzvp8j8IpfhgQmNorFpXb1SzXLfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RbLsaw7ky18ySrWdbNZPrX6gAOYIrsWbKBAthQgEs89Z8n0QPyvFRFxA29hx7nw+c+Z8CpOtTdvdRmCcV125tzgYbIBhlf8ZuWaV2EcRTMzQeFr3xnMwiV8DE9bNaYSyFRmlnBERYV/a4GCnODwJ+ayO2myRxVW2v17vv66nju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=gb16/+RV; arc=none smtp.client-ip=193.222.135.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 36768 invoked from network); 2 Jun 2025 21:52:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1748893979; bh=Fcz640mvj6gMj4rgzvp8j8IpfhgQmNorFpXb1SzXLfA=;
          h=Subject:To:Cc:From;
          b=gb16/+RVJhXAXJ6L8/jw2ToDupfDyI1vzS8EcHXxES4Eduo0bwTrJnpktOv+h6EIj
           7srUIS5GlVP7gpQZPKfkMLheH1w3IAaNhpUYJ/VHOwUSCcyOM6iKuY20NNBdApwg8v
           C3d2SP++WWFfFpRbElqloFgHO2mB8EPY4ZGV1aFiJCpvumRPiCLrskvcRQFUmyeJM4
           g+5ctJd4yGCnTzaIGRBNmpdEIF5zC1uckmKTDHYFdSbEnPpBY0tZ/FeL9amP5rsVld
           I+rKBNqAHRq8Ps0IpqhxcRpXWZIgR9CHYE9jq2gLWRp5gRp+ctFWmOTiI4s704RPFI
           fbfeu8zHOSDqw==
Received: from apn-31-0-2-65.dynamic.gprs.plus.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[31.0.2.65])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <chris.bainbridge@gmail.com>; 2 Jun 2025 21:52:59 +0200
Message-ID: <74bcd576-d410-45b2-aaf0-05aedf96b8be@o2.pl>
Date: Mon, 2 Jun 2025 21:52:56 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] timekeeping: Add a lockdep override in tick_freeze().
To: Chris Bainbridge <chris.bainbridge@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 linux-rtc@vger.kernel.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, lkml <linux-kernel@vger.kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
References: <20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local>
 <87sempv17b.ffs@tglx> <20250403135031.giGKVTEO@linutronix.de>
 <20250403193659.hhUTgJLH@linutronix.de> <87r029uh3j.ffs@tglx>
 <20250404133429.pnAzf-eF@linutronix.de> <aDtJ92foPUYmGheF@debian.local>
 <aDtVhPJD43DKNG3A@debian.local>
Content-Language: en-GB, pl
From: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Autocrypt: addr=mat.jonczyk@o2.pl; keydata=
 xsFNBFqMDyQBEAC2VYhOvwXdcGfmMs9amNUFjGFgLixeS2C1uYwaC3tYqjgDQNo/qDoPh52f
 ExoTMJRqx48qvvY/i6iwia7wOTBxbYCBDqGYxDudjtL41ko8AmbGOSkxJww5X/2ZAtFjUJxO
 QjNESFlRscMfDv5vcCvtH7PaJJob4TBZvKxdL4VCDCgEsmOadTy5hvwv0rjNjohau1y4XfxU
 DdvOcl6LpWMEezsHGc/PbSHNAKtVht4BZYg66kSEAhs2rOTN6pnWJVd7ErauehrET2xo2JbO
 4lAv0nbXmCpPj37ZvURswCeP8PcHoA1QQKWsCnHU2WeVw+XcvR/hmFMI2QnE6V/ObHAb9bzg
 jxSYVZRAWVsdNakfT7xhkaeHjEQMVRQYBL6bqrJMFFXyh9YDj+MALjyb5hDG3mUcB4Wg7yln
 DRrda+1EVObfszfBWm2pC9Vz1QUQ4CD88FcmrlC7n2witke3gr38xmiYBzDqi1hRmrSj2WnS
 RP/s9t+C8M8SweQ2WuoVBLWUvcULYMzwy6mte0aSA8XV6+02a3VuBjP/6Y8yZUd0aZfAHyPi
 Rf60WVjYNRSeg27lZ9DJmHjSfZNn1FrtZi3W9Ff6bry/SY9D136qXBQxPYxXQfaGDhVeLUVF
 Q+NIZ6NEjqrLQ07LEvUW2Qzk2q851/IaXZPtP6swx0gqrpjNrwARAQABzSRNYXRldXN6IEpv
 xYRjenlrIDxtYXQuam9uY3p5a0BvMi5wbD7CwX4EEwECACgFAlqMDyQCGwMFCRLMAwAGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEPvWWrhhCv7Gb0MQAJVIpJ1KAOH6WaT8e65xZulI
 1jkwGwNp+3bWWc5eLjKUnXtOYpa9oIsUUAqvh/L8MofGtM1V11kSX9dEloyqlqDyNSQk0h52
 hZxMsCQyzjGOcBAi0zmWGYB4xu6SXj4LpVpIPW0sogduEOfbC0i7uAIyotHgepQ8RPGmZoXU
 9bzFCyqZ8kAqwOoCCx+ccnXtbnlAXQmDb88cIprAU+Elk4k4t7Bpjn2ek4fv35PsvsBdRTq3
 ADg8sGuq4KQXhbY53n1tyiab3M88uv6Cv//Ncgx+AqMdXq2AJ7amFsYdvkTC98sx20qk6Cul
 oHggmCre4MBcDD4S0qDXo5Z9NxVR/e9yUHxGLc5BlNj+FJPO7zwvkmIaMMnMlbydWVke0FSR
 AzJaEV/NNZKYctw2wYThdXPiz/y7aKd6/sM1jgPlleQhs3tZAIdjPfFjGdeeggv668M7GmKl
 +SEzpeFQ4b0x64XfLfLXX8GP/ArTuxEfJX4L05/Y9w9AJwXCVEwW4q17v8gNsPyVUVEdIroK
 cve6cgNNSWoxTaYcATePmkKnrAPqfg+6qFM4TuOWmyzCLQ1YoUZMxH+ddivDQtlKCp6JgGCz
 c9YCESxVii0vo8TsHdIAjQ/px9KsuYBmOlKnHXKbj6BsE/pkMMKQg/L415dvKzhLm2qVih7I
 U16IAtK5b7RpzsFNBFqMDyQBEACclVvbzpor4XfU6WLUofqnO3QSTwDuNyoNQaE4GJKEXA+p
 Bw5/D2ruHhj1Bgs6Qx7G4XL3odzO1xT3Iz6w26ZrxH69hYjeTdT8VW4EoYFvliUvgye2cC01
 ltYrMYV1IBXwJqSEAImU0Xb+AItAnHA1NNUUb9wKHvOLrW4Y7Ntoy1tp7Vww2ecAWEIYjcO6
 AMoUX8Q6gfVPxVEQv1EpspSwww+x/VlDGEiiYO4Ewm4MMSP4bmxsTmPb/f/K3rv830ZCQ5Ds
 U0rzUMG2CkyF45qXVWZ974NqZIeVCTE+liCTU7ARX1bN8VlU/yRs/nP2ISO0OAAMBKea7slr
 mu93to9gXNt3LEt+5aVIQdwEwPcqR09vGvTWdRaEQPqgkOJFyiZ0vYAUTwtITyjYxZWJbKJh
 JFaHpMds9kZLF9bH45SGb64uZrrE2eXTyI3DSeUS1YvMlJwKGumRTPXIzmVQ5PHiGXr2/9S4
 16W9lBDJeHhmcVOsn+04x5KIxHtqAP3mkMjDBYa0A3ksqD84qUBNuEKkZKgibBbs4qT35oXf
 kgWJtW+JziZf6LYx4WvRa80VDIIYCcQM6TrpsXIJI+su5qpzON1XJQG2iswY8PJ40pkRI9Sm
 kfTFrHOgiTpwZnI9saWqJh2ABavtnKZ1CtAY2VA8gmEqQeqs2hjdiNHAmRxR2wARAQABwsFl
 BBgBAgAPBQJajA8kAhsMBQkSzAMAAAoJEPvWWrhhCv7GhpYP/1tH/Kc35OgWu2lsgJxR9Z49
 4q+yYAuu11p0aQidL5utMFiemYHvxh/sJ4vMq65uPQXoQ3vo8lu9YR/p8kEt8jbljJusw6xQ
 iKA1Cc68xtseiKcUrjmN/rk3csbT+Qj2rZwkgod8v9GlKo6BJXMcKGbHb1GJtLF5HyI1q4j/
 zfeu7G1gVjGTx8e2OLyuBJp0HlFXWs2vWSMesmZQIBVNyyL9mmDLEwO4ULK2quF6RYtbvg+2
 PMyomNAaQB4s1UbXAO87s75hM79iszIzak2am4dEjTx+uYCWpvcw3rRDz7aMs401CphrlMKr
 WndS5qYcdiS9fvAfu/Jp5KIawpM0tVrojnKWCKHG4UnJIn+RF26+E7bjzE/Q5/NpkMblKD/Y
 6LHzJWsnLnL1o7MUARU++ztOl2Upofyuj7BSath0N632+XCTXk9m5yeDCl/UzPbP9brIChuw
 gF7DbkdscM7fkYzkUVRJM45rKOupy5Z03EtAzuT5Z/If3qJPU0txAJsquDohppFsGHrzn/X2
 0nI2LedLnIMUWwLRT4EvdYzsbP6im/7FXps15jaBOreobCaWTWtKtwD2LNI0l9LU9/RF+4Ac
 gwYu1CerMmdFbSo8ZdnaXlbEHinySUPqKmLHmPgDfxKNhfRDm1jJcGATkHCP80Fww8Ihl8aS
 TANkZ3QqXNX2
In-Reply-To: <aDtVhPJD43DKNG3A@debian.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: 5ea12a9f76c8c90aa018d69cfb6df30c
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [seNB]                               

W dniu 31.05.2025 o 21:16, Chris Bainbridge pisze:
> On Sat, May 31, 2025 at 07:27:03PM +0100, Chris Bainbridge wrote:
>> Hi,
>>
>> I'm getting "WARNING: inconsistent lock state" on resume with this
>> commit (92e250c624ea37fde64bfd624fd2556f0d846f18):
>>
> Further testing shows there are some required conditions for this
> warning to be shown. The suspend must be of a short enough duration that
> it does "not reach hardware sleep state" (according to amd_s2idle.py).
>
> Also the warning is only shown once, I don't know if this is because the
> conditions for the warning only occur once, or if there is log limit
> somewhere that prevents it from being logged more than once.
>
> I can reliably reproduce the warning by running amd_s2idle.py and
> waiting for the automatic resume:
>
> # ./amd_s2idle.py --log log --duration 5 --wait 4 --count 1
> Debugging script for s2idle on AMD systems
> 💻 HP HP Pavilion Aero Laptop 13-be0xxx (103C_5335KV HP Pavilion) running BIOS 15.17 (F.17) released 12/18/2024 and EC 79.31
> 🐧 Debian GNU/Linux trixie/sid
> 🐧 Kernel 6.15.0-rc1-00002-g92e250c624ea
> 🔋 Battery BAT0 (313-27-3C-A PC03043XL) is operating at 100.00% of design
> Checking prerequisites for s2idle
> ✅ Logs are provided via systemd
> ✅ AMD Ryzen 7 5800U with Radeon Graphics (family 19 model 50)
> ✅ SMT enabled
> ✅ LPS0 _DSM enabled
> ✅ ACPI FADT supports Low-power S0 idle
> ✅ HSMP driver `amd_hsmp` not detected (blocked: False)
> ✅ PMC driver `amd_pmc` loaded (Program 0 Firmware 64.73.0)
> ✅ GPU driver `amdgpu` bound to 0000:03:00.0
> ✅ System is configured for s2idle
> ✅ NVME Intel Corporation SSD 670p Series [Keystone Harbor] is configured for s2idle in BIOS
> ✅ GPIO driver `pinctrl_amd` available
> 🚦 Device firmware checks unavailable without fwupd gobject introspection
> Started at 2025-05-31 19:46:33.911590 (cycle finish expected @ 2025-05-31 19:46:42.911616)
> Results from last s2idle cycle
> ○ Suspend count: 1
> ○ Hardware sleep cycle count: 1
> ○ Wakeup triggered from IRQ 9: ACPI SCI
> ○ Woke up from IRQ 9: ACPI SCI
> ○ gpe03 increased from 140 to 148
> ✅ Userspace suspended for 0:00:08.256333
> ❌ Did not reach hardware sleep state
>
> If the duration arg is 6 or higher, then amd_s2idle.py reports that the
> hardware sleep state was entered, and the "inconsistent lock state"
> warning does not appear. If the duration is too low (e.g. 1 second),
> then the laptop does not wake up automatically, and upon pressing a
> keyboard key, the amdgpu driver will report an error resuming the GPU,
> and the GPU will not be working. (I don't think the amdgpu problem is
> related to the lock state warning, I'm just mentioning it for
> completeness). It is the state between these two cases, where the laptop
> does suspend and resume correctly, but the suspend is too short to enter
> a hardware sleep state, where the problem occurs.

Hello,

Thank you for this bug report.

amd_s2idle apparently uses an RTC alarm to wake the system up
(which on newer systems is handled by ACPI SCI instead).
When the delay before the alarm is very low (like 1 second),
the alarm fires before the system is fully
suspended and the system does not wake thereafter - you have
to wake it up manually. The ACPI SPI interrupt is queued, however,
and fires just thereafter.

It appears, however, that both the RTC interrupt and ACPI SPI
interrupts fired (one after the other or at the same time).

I have noticed that cmos_interrupt() in drivers/rtc/rtc-cmos.c
uses spin_lock(), not spin_lock_irqsave() etc., even though it
can be called from a non-interrupt context - indirectly by
cmos_resume() during system resume and also by rtc_handler().

This can lead to a deadlock and is likely while lockdep is
complaining - see "Single-lock state rules:" in
Documentation/locking/lockdep-design.rst .

It is possible that
commit 92e250c624ea ("timekeeping: Add a lockdep override in tick_freeze()")
is masking the current problem because only the first issue is shown.

I'll send you a debug patch shortly.

Greetings,
Mateusz


