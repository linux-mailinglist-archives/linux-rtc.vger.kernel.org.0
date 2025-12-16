Return-Path: <linux-rtc+bounces-5573-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D81CC2068
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Dec 2025 11:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C3A63005E9F
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Dec 2025 10:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CD82E719B;
	Tue, 16 Dec 2025 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="XcM2/l/h"
X-Original-To: linux-rtc@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E27645948;
	Tue, 16 Dec 2025 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765882295; cv=none; b=YfmqH84CrZr6zf9pZUZFCmfVI69pF1tj75P73zvUtZnOTeQB/V2Fwe86kiF6mba0LUcee61JM5PZEwkjvv4CxXYhOJUNqlNdg33gnGIt1d+ZTU5tq370ipyj1BbniMnRLJN+t7ksk6Pxd1T+O/EpxqMu3hPuMixT3kuS6y5Ufvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765882295; c=relaxed/simple;
	bh=u8ksKZ5EyjUtTXiyhvIGHmJc42ntOt8GzlmAhzorWB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ovy1HHTmlmmS/OGowjJtqxPNiJFgTdqTShfb4Y75ByfN8jV1WWq9R1K6eRUymHfv5j4BGUUqSycdSJeFM8cbyRlfzwsCAGlpA2l6Z8Co2ZIYy/VtMEJ2memRgH+E5uWJ07KWjHe8ZP/N0g3VCoi8n7kA9iLe68OtF/al+M4zexo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=XcM2/l/h; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=yLdtDyF9YwP7ISvcRawhi0NSmBjSBSf03ccAR2RwNco=; t=1765882293;
	x=1766314293; b=XcM2/l/hE8+OwkiwN6BtB4bapqwK4rXnqiiJLQYahmPTZj59Ip3OZTaZQ3H9D
	HYn3t6b/G0lMJOsNH18UEV1spOCdKDk/QPKDnCGy1sWb5VjYKJJTm85U9P4cQVy/Yf4yYhqRMwIX7
	vrQazCLQhvxByf/4oDJXTY1NpKjHnT1OA4EIBYy6StABcEZ27f4fZJYtVXtnKYqPtODBIF72VadVL
	1N7yo4pGSBqAtK4msYHzw2yeqQwOkhYJDYJw5gKuhZBEs6jLDluDnod7eRP8MXdTaBR2/plTbefQF
	bkDeXLoV8Ig+0sq6V+QyOknkIHo2GRFV8fkZ4FVIAcRAa0PdpA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vVSeR-00C3S8-0t;
	Tue, 16 Dec 2025 11:51:31 +0100
Message-ID: <80e7450d-d842-49ca-8219-a995c8ce8bfe@leemhuis.info>
Date: Tue, 16 Dec 2025 11:51:30 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: interface: Alarm race handling should not discard
 preceding error
To: "Anthony Pighin (Nokia)" <anthony.pighin@nokia.com>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 Nick Bowler <nbowler@draconx.ca>, Esben Haabendal <esben@geanix.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
X-Enigmail-Draft-Status: N11222
Autocrypt: addr=linux@leemhuis.info; keydata=
 xsFNBFJ4AQ0BEADCz16x4kl/YGBegAsYXJMjFRi3QOr2YMmcNuu1fdsi3XnM+xMRaukWby47
 JcsZYLDKRHTQ/Lalw9L1HI3NRwK+9ayjg31wFdekgsuPbu4x5RGDIfyNpd378Upa8SUmvHik
 apCnzsxPTEE4Z2KUxBIwTvg+snEjgZ03EIQEi5cKmnlaUynNqv3xaGstx5jMCEnR2X54rH8j
 QPvo2l5/79Po58f6DhxV2RrOrOjQIQcPZ6kUqwLi6EQOi92NS9Uy6jbZcrMqPIRqJZ/tTKIR
 OLWsEjNrc3PMcve+NmORiEgLFclN8kHbPl1tLo4M5jN9xmsa0OZv3M0katqW8kC1hzR7mhz+
 Rv4MgnbkPDDO086HjQBlS6Zzo49fQB2JErs5nZ0mwkqlETu6emhxneAMcc67+ZtTeUj54K2y
 Iu8kk6ghaUAfgMqkdIzeSfhO8eURMhvwzSpsqhUs7pIj4u0TPN8OFAvxE/3adoUwMaB+/plk
 sNe9RsHHPV+7LGADZ6OzOWWftk34QLTVTcz02bGyxLNIkhY+vIJpZWX9UrfGdHSiyYThHCIy
 /dLz95b9EG+1tbCIyNynr9TjIOmtLOk7ssB3kL3XQGgmdQ+rJ3zckJUQapLKP2YfBi+8P1iP
 rKkYtbWk0u/FmCbxcBA31KqXQZoR4cd1PJ1PDCe7/DxeoYMVuwARAQABzSdUaG9yc3RlbiBM
 ZWVtaHVpcyA8bGludXhAbGVlbWh1aXMuaW5mbz7CwZQEEwEKAD4CGwMFCwkIBwMFFQoJCAsF
 FgIDAQACHgECF4AWIQSoq8a+lZZX4oPULXVytubvTFg9LQUCaOO74gUJHfEI0wAKCRBytubv
 TFg9Lc4iD/4omf2z88yGmior2f1BCQTAWxI2Em3S4EJY2+Drs8ZrJ1vNvdWgBrqbOtxN6xHF
 uvrpM6nbYIoNyZpsZrqS1mCA4L7FwceFBaT9CTlQsZLVV/vQvh2/3vbj6pQbCSi7iemXklF7
 y6qMfA7rirvojSJZ2mi6tKIQnD2ndVhSsxmo/mAAJc4tiEL+wkdaX1p7bh2Ainp6sfxTqL6h
 z1kYyjnijpnHaPgQ6GQeGG1y+TSQFKkb/FylDLj3b3efzyNkRjSohcauTuYIq7bniw7sI8qY
 KUuUkrw8Ogi4e6GfBDgsgHDngDn6jUR2wDAiT6iR7qsoxA+SrJDoeiWS/SK5KRgiKMt66rx1
 Jq6JowukzNxT3wtXKuChKP3EDzH9aD+U539szyKjfn5LyfHBmSfR42Iz0sofE4O89yvp0bYz
 GDmlgDpYWZN40IFERfCSxqhtHG1X6mQgxS0MknwoGkNRV43L3TTvuiNrsy6Mto7rrQh0epSn
 +hxwwS0bOTgJQgOO4fkTvto2sEBYXahWvmsEFdLMOcAj2t7gJ+XQLMsBypbo94yFYfCqCemJ
 +zU5X8yDUeYDNXdR2veePdS3Baz23/YEBCOtw+A9CP0U4ImXzp82U+SiwYEEQIGWx+aVjf4n
 RZ/LLSospzO944PPK+Na+30BERaEjx04MEB9ByDFdfkSbM7BTQRSeAENARAAzu/3satWzly6
 +Lqi5dTFS9+hKvFMtdRb/vW4o9CQsMqL2BJGoE4uXvy3cancvcyodzTXCUxbesNP779JqeHy
 s7WkF2mtLVX2lnyXSUBm/ONwasuK7KLz8qusseUssvjJPDdw8mRLAWvjcsYsZ0qgIU6kBbvY
 ckUWkbJj/0kuQCmmulRMcaQRrRYrk7ZdUOjaYmjKR+UJHljxLgeregyiXulRJxCphP5migoy
 ioa1eset8iF9fhb+YWY16X1I3TnucVCiXixzxwn3uwiVGg28n+vdfZ5lackCOj6iK4+lfzld
 z4NfIXK+8/R1wD9yOj1rr3OsjDqOaugoMxgEFOiwhQDiJlRKVaDbfmC1G5N1YfQIn90znEYc
 M7+Sp8Rc5RUgN5yfuwyicifIJQCtiWgjF8ttcIEuKg0TmGb6HQHAtGaBXKyXGQulD1CmBHIW
 zg7bGge5R66hdbq1BiMX5Qdk/o3Sr2OLCrxWhqMdreJFLzboEc0S13BCxVglnPqdv5sd7veb
 0az5LGS6zyVTdTbuPUu4C1ZbstPbuCBwSwe3ERpvpmdIzHtIK4G9iGIR3Seo0oWOzQvkFn8m
 2k6H2/Delz9IcHEefSe5u0GjIA18bZEt7R2k8CMZ84vpyWOchgwXK2DNXAOzq4zwV8W4TiYi
 FiIVXfSj185vCpuE7j0ugp0AEQEAAcLBfAQYAQoAJgIbDBYhBKirxr6Vllfig9QtdXK25u9M
 WD0tBQJo47viBQkd8QjTAAoJEHK25u9MWD0tCH8P/1b+AZ8K3D4TCBzXNS0muN6pLnISzFa0
 cWcylwxX2TrZeGpJkg14v2R0cDjLRre9toM44izLaz4SKyfgcBSj9XET0103cVXUKt6SgT1o
 tevoEqFMKKp3vjDpKEnrcOSOCnfH9W0mXx/jDWbjlKbBlN7UBVoZD/FMM5Ul0KSVFJ9Uij0Z
 S2WAg50NQi71NBDPcga21BMajHKLFzb4wlBWSmWyryXI6ouabvsbsLjkW3IYl2JupTbK3viH
 pMRIZVb/serLqhJgpaakqgV7/jDplNEr/fxkmhjBU7AlUYXe2BRkUCL5B8KeuGGvG0AEIQR0
 dP6QlNNBV7VmJnbU8V2X50ZNozdcvIB4J4ncK4OznKMpfbmSKm3t9Ui/cdEK+N096ch6dCAh
 AeZ9dnTC7ncr7vFHaGqvRC5xwpbJLg3xM/BvLUV6nNAejZeAXcTJtOM9XobCz/GeeT9prYhw
 8zG721N4hWyyLALtGUKIVWZvBVKQIGQRPtNC7s9NVeLIMqoH7qeDfkf10XL9tvSSDY6KVl1n
 K0gzPCKcBaJ2pA1xd4pQTjf4jAHHM4diztaXqnh4OFsu3HOTAJh1ZtLvYVj5y9GFCq2azqTD
 pPI3FGMkRipwxdKGAO7tJVzM7u+/+83RyUjgAbkkkD1doWIl+iGZ4s/Jxejw1yRH0R5/uTaB MEK4
In-Reply-To: <BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1765882293;779aca84;
X-HE-SMSGID: 1vVSeR-00C3S8-0t

Lo! FWIW, Nick Bowler (now CCed) reported that below patch fixes a
regression for him caused by the commit from Esben (now also CCed) the
Fixes: tag mentions. See "hwclock busted w/ M48T59 RTC (regression)" for
details:
https://lore.kernel.org/all/2t6bhs4udbu55ctbemkhlluchz2exrwown7kmu2gss6zukaxdm@ughygemahmem/
and

Nick, could you maybe provide a tested-by tag here? Maybe that would
motivate someone to get this en route to mainline.

Adding a "Cc: <stable@vger.kernel.org>" would be great, too, as Nick
encountered this on earlier series, as it was backported all the way to
5.15.y

Ciao, Thorsten

On 11/25/25 18:35, Anthony Pighin (Nokia) wrote:
> Commit 795cda8338ea ("rtc: interface: Fix long-standing race when setting
> alarm") should not discard any errors from the preceding validations.
> 
> Prior to that commit, if the alarm feature was disabled, or the
> set_alarm failed, a meaningful error code would be returned to the
> caller for further action.
> 
> After, more often than not, the __rtc_read_time will cause a success
> return code instead, misleading the caller.
> 
> An example of this is when timer_enqueue is called for a rtc-abx080x
> device. Since that driver does not clear the alarm feature bit, but
> instead relies on the set_alarm operation to return invalid, the discard
> of the return code causes very different behaviour; i.e.
>     hwclock: select() to /dev/rtc0 to wait for clock tick timed out
> 
> Fixes: 795cda8338ea ("rtc: interface: Fix long-standing race when setting alarm")
> Signed-off-by: Anthony Pighin <anthony.pighin@nokia.com>
> ---
>  drivers/rtc/interface.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index b8b298efd9a9..1906f4884a83 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -457,7 +457,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
>          * are in, we can return -ETIME to signal that the timer has already
>          * expired, which is true in both cases.
>          */
> -       if ((scheduled - now) <= 1) {
> +       if (!err && (scheduled - now) <= 1) {
>                 err = __rtc_read_time(rtc, &tm);
>                 if (err)
>                         return err;
> --
> 2.43.0


